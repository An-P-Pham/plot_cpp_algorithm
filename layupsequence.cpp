#include <chrono>
#include <iostream>

/*
    Implement algorithm of that computes the Nth value of
    a special sequence called "Layup Sequence" defined as:
            {
    S(n) =

            }
    Input: 1 <= n <= maximum value of positive 32-bit integer 2^32 - 1
    Output: Nth value of S(N), based on the function described above
        - we choose a 64-bit unsigned value to output to prevent integer
        overflow from two large uint32_t values  
*/
uint64_t layupSeq(const uint32_t n)
{

    // Base-Case: The input values of  
    if(n <= 2)
        return n;
    
    // Value of S(n-1)
    uint64_t prevPrevVal = 1;
    // Value of S(n-2)
    uint64_t prevVal = 2;

    /*
        Although we can solve this recursively, we will iteratively solve this via Dynamic Programming
        via bottom-up approach. In addition, we do optimize by not caching the values of 
        1 to N, since we only care about calculating the Nth value with is only dependent
        on S(N-1) and S(N-2). Overall we save memory both stack/heap memory, which optimizes SW execution
        time. Utilizing C++ STL containers call heap memory under the hood, while function call stacks add
        overhead in our SW execution speed.
    */
    uint64_t nthSeqVal;
    for(uint32_t i=3; i<=n; ++i) {
        nthSeqVal = i % 2 == 0 ? (prevVal + prevPrevVal) : (2*prevVal - prevPrevVal);
        // Update the two previous values
        prevPrevVal = prevVal;
        prevVal =nthSeqVal;
    }

    return nthSeqVal; 
}

/*
    alias for easier readability
*/
using namespace std::chrono;
using std::chrono::high_resolution_clock;

int main(int argc, char* argv[])
{
    // Take in input
    uint64_t nthVal = 0;
    constexpr uint32_t startVal = 1;
    constexpr uint32_t endVal = 1000000000;
    for(uint32_t inputVal = startVal; inputVal <= endVal; inputVal *= 10) {
        // Start Time of Our Code
        auto start_time = high_resolution_clock::now();
        nthVal = layupSeq(inputVal);
        auto end_time = high_resolution_clock::now();
        std::cout << "N=" << inputVal << ", Value=" << nthVal << ", "; 
        std::cout << "Time Taken=" << static_cast<double>(duration_cast<nanoseconds>(end_time - start_time).count() * 0.001) << std::endl;
    }
    
    return 0;
}
