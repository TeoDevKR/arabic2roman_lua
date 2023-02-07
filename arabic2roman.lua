--[[
MIT License

Copyright (c) 2023 Teo Han

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
]]

function getDigit(position, number)
  local result = math.floor((number / 10 ^ (position-1)) % 10);
  return result;
end

function convertToRoma(digit, space, len)
  roma = "I";
  if digit == 0 then
    roma = "";
  elseif digit == 1 then
    roma = "I";
  elseif digit == 2 then
    roma = "II";
  elseif digit == 3 then
    roma = "III";
  elseif digit == 4 then
    roma = "IV";
  elseif digit == 5 then
    roma = "V";
  elseif digit == 6 then
    roma = "VI";
  elseif digit == 7 then
    roma = "VII";
  elseif digit == 8 then
    roma = "VIII";
  elseif digit == 9 then
    roma = "IX";
  elseif digit == 10 then
    roma = "X";
  end
  if space == 2 then
    if digit == len then
      return roma;
    end
    return roma .. " ";
  end
  return roma;
end

function convertToUpperRoma(position, roma)
  if position < 2 then
    return roma;
  end
  if roma == "" then
    return "";
  end
  loop = (position - 2) % 3 + 1;
  if loop == 1 then
    roma = string.gsub(roma, "X", "C");
    roma = string.gsub(roma, "I", "X");
    roma = string.gsub(roma, "V", "L");
  elseif loop == 2 then
    roma = string.gsub(roma, "X", "M");
    roma = string.gsub(roma, "I", "C");
    roma = string.gsub(roma, "V", "D");
  elseif loop == 3 then
    roma = string.gsub(roma, "I", "M");
  end
  return roma;
end

function numberToRoma(number, space)
  local num_str = tostring(number);
  local len = string.len(num_str);
  result = "";
  for i = 1, len, 1 do
    digit = getDigit(i, number);
    roma = convertToRoma(digit, space, len);
    result = convertToUpperRoma(i, roma) .. result;
  end
  return result;
end

roma = numberToRoma(117, 1);
print(result);



