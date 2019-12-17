import Data.Char
--import Text.ParserCombinators.Parsec
import Untyped
import Data.List
import Data.Bool

--csvFile = endBy line eol
--line = sepBy cell (char '=')
--cell = many (noneOf "=\n")
--eol = char '\n'

--parseCSV :: String -> Either ParseError [[String]]
--parseCSV input = parse csvFile "(unknown)" input

-- 
--------------------------------------------------------------------------------------------------------------------------------
-- is_there a xs = return true is a is inside xs, false otherwise
is_there :: Char -> String -> Bool
is_there a [] = False
is_there a (x : xs) = (x == a) || (is_there a xs)

--------------------------------------------------------------------------------------------------------------------------------

-- separate_by from dont_take taken 
-- Divides the string "from" using characters in "dont_take" and adds that to "taken"
-- sample output
--  separate_by  "abcd" "bc" ["kl","mn"] = ["mn","kla","d"]
-- separate_by  "abcdefg" "bcf" [] = ["a","de","g"]
separate_by :: String -> String -> [String] -> [String]    
separate_by [] dont_take taken = reverse taken
separate_by (x : xs) dont_take [] = 
    if (is_there x dont_take)
    then 
        separate_by xs dont_take []
    else
        separate_by xs dont_take [[x]]
separate_by (x : xs) dont_take ([] : ys) = 
    if (is_there x dont_take) 
    then
        separate_by xs dont_take ([] :  ys)
    else
        separate_by xs dont_take ([x] : ys)
separate_by (x : xs) dont_take ((y : ys) : yss) = 
    if (is_there x dont_take) 
    then
        separate_by xs dont_take ([] : ((y : ys) : yss))
    else
        separate_by xs dont_take ( ((y : ys) ++ [x]) : yss)
     
------------------------------------------------------------------------------------------------------------------   
        
--  take_except from dont_take taken
-- filters the characters in "from" which are in "dont_take"       
take_except :: String -> String -> String -> String
take_except [] dont_take taken = taken
take_except (x : xs) dont_take taken = 
    if (is_there x dont_take)
    then
        take_except xs dont_take taken
    else
        take_except xs dont_take (taken ++ [x])          


  
        
                 
