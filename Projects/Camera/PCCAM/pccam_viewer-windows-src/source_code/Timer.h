#include <winnt.h>

class Timer
{
    private:

        LARGE_INTEGER   freq;
        LARGE_INTEGER   acounter;
        LARGE_INTEGER   scounter;
        LARGE_INTEGER   ecounter;

        bool started;

    public:
        Timer() :started(false)
            {
                acounter.QuadPart = 0;
                QueryPerformanceFrequency(&freq);
            };

        void reset()
            {
                started  = false;
                acounter.QuadPart = 0;
            };
        void start()
            {
                started=true;
                QueryPerformanceCounter(&scounter);
             };
        void stop()
            {   if(!started)
                    return;
                QueryPerformanceCounter(&ecounter);
                acounter.QuadPart += ecounter.QuadPart - scounter.QuadPart;
                started = false;
            }
        double  time()
            {
                if (started)
                    return 0.0;
                 return double(acounter.QuadPart)/double(freq.QuadPart);
            }
};

