Railway Crossing Controller Simulation

Time=0   | Train Detect=0 | Train Clear=0 | Gate Open=1 | Gate Close=0 | Warning=0

Normal Condition:
Gate Open = 1
Gate Close = 0
Warning = 0

Train Approaching:
Train Detect = 1
Gate Open = 0
Gate Close = 1
Warning = 1

Train Crossing:
Gate Open = 0
Gate Close = 1
Warning = 1

Train Passed:
Train Clear = 1
Gate Open = 1
Gate Close = 0
Warning = 0

Simulation completed successfully.