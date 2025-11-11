# 001 Digit Sum

Suppose N is a total maximum digits of all integers number starting from zero to the maximum digit.
For example, N=1 is 0 to 9. N=3 is 000 to 999. Suppose S is a total sum of the digits. For example,
for number 212, S is 5.

Find ALL COUNT of possible numbers given S and N.

For example, if S = 1 and N = 4, then count is 4 (only 1, 10, 100, 1000 fulfill the condition)  
S = 2, N=4, count is 10 (2, 11, 20, 101, 110, 200, 1001, 1010, 1100, 2000)

## Running brute force for proof

    # ruby proof.rb N S
    ruby proof 4 15

## Running optimized solution

    # ruby optimized.rb N S
    ruby optimized 4 15
