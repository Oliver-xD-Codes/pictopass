#include <nds.h>
#include <stdio.h>

// Function to detect if the app is running on a 3DS
bool isRunningOn3DS() {
    // This register check is a trick to detect the 3DS
    return (*(vu32*)0x10140000) == 0x00000000;
}

int main(void) {
    // Initialize the console output
    consoleDemoInit();

    // Display the startup message
    if (isRunningOn3DS()) {
        iprintf("I'm going to eat your 3DS 😈\n");
    } else {
        iprintf("Running on a normal DS/DSi 👌\n");
    }

    // Main menu message
    iprintf("\nWelcome to PictoPass\n");
    iprintf("Press A to broadcast message\n");

    while (1) {
        swiWaitForVBlank();  // Wait for the vertical blanking period to avoid overloading the CPU
        scanKeys();          // Scan the key presses

        int keys = keysDown();  // Get which keys were pressed

        if (keys & KEY_A) {
            iprintf("Sending message...\n");
            // Here you could add functionality to "send" messages via local wireless
        }
    }

    return 0;
}
