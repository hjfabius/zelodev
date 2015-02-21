//---------------------------------------------------------------------------

#ifndef PlayThreadH
#define PlayThreadH
//---------------------------------------------------------------------------
#include <Classes.hpp>
//---------------------------------------------------------------------------
class PlayLoop : public TThread
{
private:
protected:
        void __fastcall Execute();
public:
        __fastcall PlayLoop(bool CreateSuspended);
};
//---------------------------------------------------------------------------
#endif
