#include "genesis.h"

int main(bool hardReset)
{
    VDP_drawText("Hello Mega Drive World!", 8, 10);
    VDP_drawText("SGDK Development Kit", 9, 12);
    VDP_drawText("Press START to continue", 7, 14);

    while(TRUE)
    {
        // nothing to do here
        // ...

        // always call this method at the end of the frame
        SYS_doVBlankProcess();
    }

    return 0;
}
