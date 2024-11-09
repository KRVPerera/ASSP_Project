/**
 * OSAL behavior definition file.
 */

#include <iostream>
#include <fstream>
#include <math.h> // isnan()

#include "OSAL.hh"
#include "TCEString.hh"
#include "OperationGlobals.hh"
#include "Application.hh"
#include "Conversion.hh"

OPERATION(SIMD_MAC)

TRIGGER

    int result;
	int in1 = INT(1);
	int in2 = INT(2);
    int in3 = INT(3);
    int in4 = INT(4);

    short K0 = 37;
    short K1 = 109;
    short K2 = 109;
    short K3 = 37;
    short SCALE = 8;

    int res1;
    int res2;
    int res3;

    res1 = K0 * in1;
    res2 = K1 * in2 + res1;
    res3 = K2 * in3 + res2;
    result = K3 * in4 + res3;

    result = result >> SCALE;
    
	IO(5) = result;
END_TRIGGER;

END_OPERATION(SIMD_MAC)
