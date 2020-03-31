# Candlesticks

Candlesticks pattern detection for MATLAB.

## Table of Contents

1. [Acknowledgements](#acknowledgements)
2. [Description](#description)
3. [Syntax](#syntax)
4. [Outputs](#outputs)
5. [Available Candlesticks](#available-candlesticks)
6. [Notes](#notes)
7. [Example](#example)
8. [ToDo](#todo)
9. [Further Information](#further-information)

## Acknowledgements

Based on the work of [Nate Jensen](https://www.mathworks.com/matlabcentral/profile/authors/2908307-nate-jensen). See reference implemention [here](https://www.mathworks.com/matlabcentral/fileexchange/33782-candlesticks).

## Description

>Since the early days of the Japanese rice traders, candlestick charting has grown into a complex technical analysis tool based primarily on patterns. Candlestick charts are flexible, because candlestick charts can be used alone or in combination with other technical analysis techniques, not instead of other technical tools. As with all charting methods, candlestick chart patterns are subject to interpretation by the user. Currently, there are 90 patterns.
>
> -- <cite>Nate Jensen</cite>

## Syntax

```matlab
[bull, bear, neutral] = candlesticks(open,high,low,close)
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

## Available Candlesticks

### Bullish 🐂

- Bullish Reversal High Reliability
  - 01 -Abandoned Baby
  - 02 - Concealing Baby Swallow
  - 03 - Kicking
  - 04 - Morning Doji Star
  - 05 - Morning Star
  - 06 - Piercing Line
  - 07 - Three Inside Up
  - 08 - Three Outside Up
  - 09 - Three White Soldiers
- Bullish Reversal Moderate Reliability
  - 10 - Breakaway
  - 11 - Counter Attack
  - 12 - Doji Star
  - 13 - Dragonfly Doji
  - 14 - Engulfing
  - 15 - Gravestone Doji
  - 16 - Harami Cross
  - 17 - Homing Pigeon
  - 18 - Ladder Bottom
  - 19 - Long Legged Doji
  - 20 - Matching Low
  - 21 - Meeting Lines
  - 22 - Stick Sandwich
  - 23 - Three Stars in the South
  - 24 - Tri Star
  - 25 - Unique Three River Bottom
- Bullish Reversal Low Reliability
  - 26 - Belt Hold
  - 27 - Hammer
  - 28 - Harami
  - 29 - Inverted Hammer
- Bullish Continuation High Reliability
  - 30 - Mat Hold
  - 31 - Rising Three Methods
- Bullish Continuation Moderate Reliability
  - 32 - Side-by-Side White Lines
  - 33 - Upside Tasuki Gap
  - 34 - Upside Gap Three Methods
- Bullish Continuation Low Reliability
  - 35 - Separating Lines
  - 36 - Three Line Strike
- Bullish Reversal/Continuation Low Reliability
  - 37 - Closing Marubozu
  - 38 - Long Line
  - 39 - Marubozu
  - 40 - Opening Marubozu

### Bearish 🐻

- Bearish Reversal High Reliability
  - 01 - Abandoned Baby
  - 02 - Dark Cloud Cover
  - 03 - Evening Doji Star
  - 04 - Evening Star
  - 05 - Kicking
  - 06 - Three Black Crows
  - 07 - Three Inside Down
  - 08 - Three Outside Down
  - 09 - Upside Gap Two Crows
- Bearish Reversal Moderate Reliability
  - 10 - Advance Block
  - 11 - Breakaway
  - 12 - Counter Attack
  - 13 - Deliberation
  - 14 - Doji Star
  - 15 - Dragonfly Doji
  - 16 - Engulfing
  - 17 - Gravestone Doji
  - 18 - Harami Cross
  - 19 - Identical Three Crows
  - 20 - Long Legged Doji
  - 21 - Meeting Lines
  - 22 - Tri Star
  - 23 - Two Crows
- Bearish Reversal Low Reliability
  - 24 - Belt Hold
  - 25 - Hanging Man
  - 26 - Harami
  - 27 - Shooting Star
- Bearish Continuation High Reliability
  - 28 - Falling Three Methods
- Bearish Continuation Moderate Reliability
  - 29 - Downside Gap Three Methods
  - 30 - Downside Tasuki Gap
  - 31 - In Neck
  - 32 - On Neck
  - 33 - Side-by-Side White Lines
- Bearish Continuation Low Reliability
  - 34 - Separating Lines
  - 35 - Three Line Strike
  - 36 - Thrusting
- Bearish Reversal/Continuation Low Reliability
  - 37 - Closing Marubozu
  - 38 - Long Line
  - 39 - Marubozu
  - 40 - Opening Marubozu

### Neutral 😐

- Neutral Reversal Moderate Reliability
  - 01 - High Wave
  - 02 - Inverted Takuri/Umbrella
  - 03 - Takuri/Umbrella
- Neutral Reversal/Continuation Low Reliability
  - 04 - Doji
  - 05 - Four Price Doji
  - 06 - Normal Line
  - 07 - Rickshaw Man
  - 08 - Short Line
  - 09 - Spinning Top
  - 10 - Stalled Pattern

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

## Further Information

For an in depth analysis of how many of these candlesticks work, refer to one of the following websites or Google it.

- http://www.candlesticker.com/
