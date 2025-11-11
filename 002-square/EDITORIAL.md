# Max Area Square Array Problem

The problem asks us to find maximum square of 1's, given an array with only zero and one.

## Intuition

To compute AREA, it is easier if we can identify LONGEST SIDE of possible squares. Let's
compute them.

For following array, the result is 0. It is obvious because there is no 1.

    0

For following array, the result is 1.

    1

For following array, the result is also 1.

    1 1 1 1 1 1

Notice that, for a SINGLE ROW ARRAY, the result is always 1. Let's inspect two rows array:

    1 0 0 0 1 1 0
    1 0 1 0 1 1 0

Challenge: can we identify of square areas, by only iterating each rows and columns?

For two arrays, it is trivial. Following algorithm will do the job. Suppose we iterate
arrays with height h over i, with width w over j, then dp[i][j] is the LONGEST SIDE OF
POSSIBLE SQUARES ending at position array of i,j (the bottom-right of the square is i,j).
We iterate i,j, such that:

- if arr[i][j] == 0, then dp[i][j] = 0. There will be no square array ending here.
- if arr[i][j] == 1, then inspect following:
  - Set dp[i][j] = 1 as initial value.
  - Is the left position (arr[i][j-1]) is NOT out of bounds and is == 1? If so, continue.
  - Is the up position (arr[i-1][j]) is NOT out of bounds and is == 1? If so, continue.
  - Is the left-up, diagonal (arr[i-1][j-1] is NOT out of bounds and is == 1? If so, continue.
  - The values for dp[i][j] is 2.

By the end of iteration, we will get dp with following values.

    1 0 0 0 1 1 0
    1 0 1 0 1 2 0

The following algorithm holds. Let's extend the array to 3 rows:

    1 0 0 0 1 1 0
    1 0 1 0 1 1 0
    1 0 1 0 1 1 0

If we re-run the above algorithm, we will get dp with following values:

    1 0 0 0 1 1 0
    1 0 1 0 1 2 0
    1 0 1 0 1 2 0

However, above algorithm doesn't work if longest side is >2. Let's make
a 3x3 square and re-run the algoritm:

    array:
    1 0 0 0 1 1 1
    1 0 1 0 1 1 1
    1 0 1 0 1 1 1
   
    dp: 
    1 0 0 0 1 1 1
    1 0 1 0 1 2 1
    1 0 1 0 1 1 1

That said, we have identified base step of the dynamic programming solution.
Let's rebuild the algorithm, such that it works for longest side > 2

## Solution

We need to build dp[i][j], such that we can hold the values for longest side >2.
Follwoing is the dp value we are looking for, given an array.

    arr:
    1 1 1
    1 1 1
    1 1 1

    dp:
    1 1 1
    1 2 2
    1 2 3

Let's examine:

- at dp[1][1], longest side is 2. It is from (0,0) to (1,1)
- at dp[2][1], longest side is also 2. It is from (1,0) to (2,1)
- at dp[3][3], longest side is 3. It is from (0,0) to (2,2)

From here, we can extend the intuition. Iterate i,j, then:

- If arr[i][j] = 0, then dp[i][j] = 0. Otherwise, continue on the next steps.
- Given we are at i,j.. retrieve the SHORTEST SIDE of the left, up, and diagonal-left-up.
  Let's call this `shortest`
- The longest side we can build the square that ends at i,j is shortest + 1


## Optimizing Solution

We don't need two dimentional array dp[i][j] for the result. As we actually only care
about dp[iteration] and dp[iteration-1], we can just use two variable holders (e.g.:
prev and cur), and then compute side_max = [max, cur.max]

(TODO)
