Here are files from Harvard CS50 teaching program, showing my work with Arrays, Algorythms and Memory management.

Algorythms >
    Plurality: This C code implements a plurality voting system using command-line arguments to define candidates, a struct to represent candidates, arrays to store them, loops and conditionals to process votes, and functions to count votes and print the winner(s).
    
    Runoff: This C code implements a ranked-choice voting (runoff) system using command-line arguments for candidates, a struct to represent candidates (with name, votes, and elimination status), a 2D array for voter preferences, and functions to handle voting, tabulation, finding the minimum vote count, checking for ties, and eliminating candidates.

Arrays >
    Caesar: This C code performs Caesar cipher encryption, accepting a numeric key via a command-line argument, validating the key's format with a loop and isdigit, getting the plaintext using CS50's get_string, allocating ciphertext memory using malloc, and applying the cipher via a rotate function which uses isupper, islower, and ASCII manipulation.

    Readability: This program computes the Coleman-Liau readability index, getting text input with get_string, using functions to count letters (with isupper and islower and bounds checking), words (detecting spaces), and sentences (identifying punctuation), and then applying the formula, employing round for the final grade level.

    Scrabble: This program compares the scores of two words (like in Scrabble), getting input via get_string, using a compute_score function that loops through each word's characters, determining letter values via a predefined POINTS array and ASCII character arithmetic (word[i] - 'A' or word[i] - 'a'), and then determines the winner based on the calculated scores.

Memory Management >
    Filter: This set of C functions manipulates images represented as 2D arrays of RGBTRIPLE structs, providing grayscale (using averaging and round), sepia (applying a color transformation with coefficients, round, and value limiting), and reflect (performing a horizontal flip by swapping pixel data).

    Volume: This program adjusts audio volume in a WAV file, using command-line arguments for filenames and a volume factor (converted using atof), opening files with fopen in binary read/write modes, copying the header using fread/fwrite and a uint8_t array, and then scaling and writing audio samples via a loop, fread, fwrite, and an int16_t variable for sample manipulation.


    