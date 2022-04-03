require 'pry-byebug'

def caesar_cipher(string, num_shift=0)
    # A = 65
    # Z = 90
    # a = 97
    # z = 122
    # check to make sure shifting is within the alphabet
    unless (num_shift.between?(-26, 26))
        return "Please shift by less than 26"
    end

    array = string.split("")
    mutated_array = []

    array.each do |letter|
        # binding.pry
        letter = letter.ord
        if letter.between?(65, 90)
            # code for capital letter wrapping
            if (letter + num_shift > 90)
                new_shift = num_shift - (90-letter)
                letter = 65 + (new_shift-2)
                letter = letter.chr
                mutated_array.push(letter)
            elsif (letter + num_shift < 65)
                new_shift = (letter - 65) + num_shift
                letter = 90 + new_shift + 1
                letter = letter.chr
                mutated_array.push(letter)
            else
                letter += num_shift
                letter = letter.chr
                mutated_array.push(letter)
            end
        elsif letter.between?(97, 122)
            # code for lowercase letter wrapping
            if (letter + num_shift > 122)
                new_shift = num_shift - (122-letter)
                letter = 97 + (new_shift-2)
                letter = letter.chr
                mutated_array.push(letter)
            elsif (letter + num_shift < 97)
                new_shift = (letter - 97) + num_shift
                letter = 122 + new_shift + 1
                letter = letter.chr
                mutated_array.push(letter)
            else
                letter += num_shift
                letter = letter.chr
                mutated_array.push(letter)
            end
        else
            mutated_array.push(letter.chr)
        end
    end
    return mutated_array.join("")
end

# tests

# should return Olssv
testing = caesar_cipher("Hello", 7)
puts testing

# should return Axeeh
testing = caesar_cipher("Hello", -7)
puts testing

# should return "please shift by less than 26"
testing = caesar_cipher("Hello", 27)
puts testing