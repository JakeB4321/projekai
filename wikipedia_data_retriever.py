import requests
from bs4 import BeautifulSoup
import pandas as pd
import re
import time

def get_artist_links_from_genre(genre_url):
    response = requests.get(genre_url)
    soup = BeautifulSoup(response.content, 'html.parser')
    artist_links = []
    # Search for lists of artists
    for ul in soup.find_all('ul'):
        for li in ul.find_all('li'):
            a_tag = li.find('a')
            if a_tag and a_tag.has_attr('href'):
                if a_tag['href'].startswith('/wiki/'):
                    link = f"https://en.wikipedia.org{a_tag['href']}"
                    if link.find("#") == -1 and link not in artist_links:
                        artist_links.append(link)
    return artist_links


def get_artist_data(artist_url):
    response = requests.get(artist_url)
    soup = BeautifulSoup(response.content, 'html.parser')
    artist_data = {
        'artist_name': None,
        'origin_countries': [],
        'genres': [],
        'years_active': None
    }
    try:
        # Extract artist name from page title
        title_tag = soup.find('h1', id="firstHeading")
        if title_tag:
           artist_data['artist_name'] = title_tag.text.strip()
        # Extract information from infobox
        infobox = soup.find('table', class_='infobox')
        if infobox:
           for row in infobox.find_all('tr'):
             th = row.find('th')
             if th:
                if "Origin" in th.text:
                   for a_tag in row.find_all('a'):
                        if a_tag.has_attr('href') and a_tag['href'].startswith('/wiki/') and a_tag.has_attr('title'):
                            artist_data['origin_countries'].append(a_tag['title'])
                elif "Genres" in th.text or "Genre" in th.text or "Styles" in th.text:
                    for a_tag in row.find_all('a'):
                        if a_tag.has_attr('href') and a_tag['href'].startswith('/wiki/') and a_tag.has_attr('title'):
                            artist_data['genres'].append(a_tag['title'])
                elif "Years active" in th.text:
                    td = row.find('td')
                    if td:
                        years_active_text = td.text.strip()
                        match = re.search(r'(\d{4})\s*[-–—]?\s*(\d{4})?', years_active_text)
                        if match:
                           start_year = match.group(1)
                           end_year = match.group(2) if match.group(2) else "present"
                           artist_data['years_active'] = f"{start_year}-{end_year}"
        if not artist_data['years_active']:
             #look in first paragraph
             paragraphs = soup.find_all('p')
             for p in paragraphs:
                match = re.search(r'(?:(?:since|from)\s)?(\d{4})\s*[-–—]?\s*(\d{4})?', p.text)
                if match:
                    start_year = match.group(1)
                    end_year = match.group(2) if match.group(2) else "present"
                    artist_data['years_active'] = f"{start_year}-{end_year}"
                    break
    except Exception as e:
       print(f"Error processing {artist_url}: {e}")
    return artist_data
def main():
    genres_to_explore = {
       "Disco": "https://en.wikipedia.org/wiki/List_of_disco_artists",
       "House": "https://en.wikipedia.org/wiki/List_of_house_music_artists",
       "Techno": "https://en.wikipedia.org/wiki/List_of_techno_artists",
       "Acid House":"https://en.wikipedia.org/wiki/Category:Acid_house_musicians",
       "Trance": "https://en.wikipedia.org/wiki/List_of_trance_artists",
       "Drum and Bass": "https://en.wikipedia.org/wiki/List_of_drum_and_bass_artists",
       "Garage": "https://en.wikipedia.org/wiki/Category:UK_garage_musicians",
       "Dubstep":"https://en.wikipedia.org/wiki/List_of_dubstep_musicians",
       "Future Bass": "https://en.wikipedia.org/wiki/Category:Future_bass_musicians",
       "Trap": "https://en.wikipedia.org/wiki/List_of_trap_artists",
       "Eurodance": "https://en.wikipedia.org/wiki/List_of_Eurodance_artists"
    }
    all_artist_data = []
    for genre, url in genres_to_explore.items():
        print(f"Processing genre: {genre}")
        artist_links = get_artist_links_from_genre(url)
        for link in artist_links:
            time.sleep(0.2)
            artist_data = get_artist_data(link)
            all_artist_data.append(artist_data)
            if len(all_artist_data) > 5000:
              break;
        if len(all_artist_data) > 5000:
            break;
    df = pd.DataFrame(all_artist_data)
    df.to_csv("artist_data_wikipedia.csv", index=False)
    print("Data exported to CSV")

if __name__ == "__main__":
   main()