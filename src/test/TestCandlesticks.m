%% Test Class Definition
classdef TestCandlesticks < matlab.unittest.TestCase
   
    %% Test Method Block
    methods (Test)
        function testSignalsOutput(testCase)
            ohlcv = testCase.loadTestData();
            options = struct('outputFormat', "signals");
            [bullSignals, bearSignals, neutralSignals] = candlesticks(ohlcv.Open, ohlcv.High, ohlcv.Low, ohlcv.Close, options);
            results = {bullSignals, bearSignals, neutralSignals};
            load('signalsResults.mat', 'signalsResults');
            expectedResults = signalsResults;
            testCase.verifyEqual(results, expectedResults, 'Results must match');
        end
        function testMapOutput(testCase)
            ohlcv = testCase.loadTestData();
            options = struct('outputFormat', "map");
            [bullMap, bearMap, neutralMap] = candlesticks(ohlcv.Open, ohlcv.High, ohlcv.Low, ohlcv.Close, options);
            results = {bullMap, bearMap, neutralMap};
            load('mapResults.mat', 'mapResults');
            expectedResults = mapResults;
            testCase.verifyEqual(results, expectedResults, 'Results must match');
        end   
        function testMapOutputWithoutOptions(testCase)
            ohlcv = testCase.loadTestData();
            [bullMap, bearMap, neutralMap] = candlesticks(ohlcv.Open, ohlcv.High, ohlcv.Low, ohlcv.Close);
            results = {bullMap, bearMap, neutralMap};
            load('mapResults.mat', 'mapResults');
            expectedResults = mapResults;
            testCase.verifyEqual(results, expectedResults, 'Results must match');
        end           
    end
    methods(Static)
        function ohlcv = loadTestData()
            load('ibm.dat', 'ibm');
            [ro, ~] = size(ibm);
            High = ibm(:,2);
            Low = ibm(:,3);
            Close = ibm(:,4);
            Volume = ibm(:,6);
            % Because there it looks there is no Open data available in the series, let's emulate by simply copying last bin's close.
            Open = [missing; Close(1:end-1)];
            startingTime = datetime('31-Dec-1994');
            endingTime = startingTime + days(ro-1);
            Times = (startingTime:endingTime)';
            ohlcv = timetable(Times, Open, High, Low, Close,Volume);
            ohlcv = rmmissing(ohlcv);
        end
    end
end