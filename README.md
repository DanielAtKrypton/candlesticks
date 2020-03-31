# Candlesticks

Candlesticks pattern detection for MATLAB.

## Table of Contents

1. [Acknowledgements](#acknowledgements)
2. [Description](#description)
3. [Syntax](#syntax)
4. [Outputs](#outputs)
5. [Notes](#notes)
6. [Example](#example)
7. [ToDo](#todo)

## Acknowledgements

Based on the work of [Nate Jensen](https://www.mathworks.com/matlabcentral/profile/authors/2908307-nate-jensen). See reference implemention [here](https://www.mathworks.com/matlabcentral/fileexchange/33782-candlesticks).

## Description

Since the early days of the Japanese rice traders, candlestick charting has grown into a complex technical analysis tool based primarily on patterns. Candlestick charts are flexible, because candlestick charts can be used alone or in combination with other technical analysis techniques, not instead of other technical tools. As with all charting methods, candlestick chart patterns are subject to interpretation by the user. Currently, there are 90 patterns.

## Syntax

```matlab
[bull bear neutral] = candlesticks(open,high,low,close)
Inputs
open - open price
high - high price
low - low price
close - close price
````

## Outputs

- bear 🐻 - bearish patterns
- bull 🐂 - bullish patterns
- neutral 😐- neutral patterns

Outputs are formatted into cells. The index of each cell corresponds
to the index of that pattern in the order listed under Candlesticks.
Each cell holds all of the indices from the input for the end of a
pattern.
For example:

- `bear{1}` is the Abandoned Baby 🚼 pattern
- `[23; 78; 92]` are the contents of that cell and are the indices of the
end of that pattern

## Notes

- data must be column oriented
- there are no argument checks
- most patterns require a prior bullish or bearish trend; this code
does not check for that
- all patterns either require, recommend, or suggest confirmation;
this code does not check for that

## Example

```matlab
load disney.mat
[bull bear neutral] = candlesticks(dis_OPEN,dis_HIGH,dis_LOW,dis_CLOSE);
```

## To Do

- add more candlesticks
- add test suite

Obs.: The full list of candlestick patterns is located in the help section.
