// index = 0.0588 * L - 0.296 * S - 15.8

#include <cs50.h>
#include <ctype.h>
#include <math.h>
#include <stdio.h>
#include <string.h>

int letters(string text);
int words(string text);
int sentences(string text);

int main(void)
{
    // Prompt the user for some text
    string text = get_string("Provide the text to determine the reading level: \n");

    // Count the number of letters, words, and sentences in the text
    int total_letters = letters(text);
    int total_words = words(text);
    int total_sentences = sentences(text);

    // Compute the Coleman-Liau index
    float L = (float) total_letters / total_words * 100;
    float S = (float) total_sentences / total_words * 100;
    float index = (float) 0.0588 * L - 0.296 * S - 15.8;
    int rounded_index = round(index);

    // Print the grade level
    if (rounded_index < 0)
    {
        printf("Before Grade 1\n");
    }
    else if (rounded_index < 15)
    {
        printf("Grade %i\n", rounded_index);
    }
    else
        printf("Grade 16+\n");
}

int letters(string text)
{
    int n_letters = 0;
    for (int i = 0, len = strlen(text); i < len; i++)
    {
        if (isupper(text[i]))
        {
            if (0 <= text[i] - 'A' && text[i] - 'A' <= 25)
                n_letters++;
        }
        else if (islower(text[i]))
        {
            if (0 <= text[i] - 'a' && text[i] - 'a' <= 25)
                n_letters++;
        }
    }
    return n_letters;
}

int words(string text)
{
    int n_words = 1;
    for (int i = 0, len = strlen(text); i < len; i++)
    {
        if (text[i] == ' ')
        {
            n_words++;
        }
    }
    return n_words;
}

int sentences(string text)
{
    int n_sentences = 0;
    for (int i = 0, len = strlen(text); i < len; i++)
    {
        if (text[i] == '.')
        {
            n_sentences++;
        }
        else if (text[i] == '?')
        {
            n_sentences++;
        }
        else if (text[i] == '!')
        {
            n_sentences++;
        }
    }
    return n_sentences;
}
