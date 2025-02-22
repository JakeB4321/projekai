#include <cs50.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <stdlib.h>

bool only_digits(string s);
char rotate(char c, int n);
int main(int argc, string argv[])

{
    if (argc != 2)
    {
        printf("Usage: ./caesar key \n");
        return 1;
    }

    // argv input must be non-negative integer. if the input is wrong, should return error code 1
    // If character in argv is not a decimal digit, your program should print the message "Usage:
    // ./caesar key" and return from main a value of 1.
    string s = argv[1];
    if (!only_digits(s))
    {
        printf("Usage: ./caesar key \n");
        return 1;
    }
    // converting string to integer

    int number = atoi(s);

    // Your program must output "plaintext:  " prompting the user for a string of plaintext (using get_string).
    //this function will rotate with ARRAY through PLAINTEXT characters in MAIN.
    string plaintext = get_string("Plaintext:  ");
    string ciphertext = malloc(strlen(plaintext) + 1); // Allocate memory for cyphertext
    for (int i = 0, len = strlen(plaintext); i < len; i++)
    {
        ciphertext[i] = rotate(plaintext[i], number);
    }
    int len = strlen(plaintext);
    ciphertext[len] = '\0';
    // Your program must output "ciphertext: " followed by the plaintext’s corresponding ciphertext
    // After outputting ciphertext, you should print a newline.
    printf("Ciphertext: %s\n", ciphertext);
    return 0;
}

bool only_digits(string s)
{
    for (int i = 0, n = strlen(s); i < n; i++)
        if (!isdigit(s[i]))
        {
            return false;
        }
    return true;
}

char rotate(char c, int n)
{
    // if n is >26 apply %26
    if (n > 26)
    {
        n = n % 26;
    }
    // cast a char to int. Subtract value of ASCII ('A' = 0, 'B' = 1) from 'isupper', 'a' from 'islower'.
    // If uppercase, else if lowercase, else do nothing.
    // apply int n to the result and cast resulting int back to char
    int number;
    if (isupper(c))
    {
        number = c - 'A';
        number = (number + n) % 26 + 'A';
    }
    else if (islower(c))
    {
        number = c - 'a';
        number = (number + n) % 26 + 'a';
    }
    else
    {
        return c;
    }
    return (char) number;
}
