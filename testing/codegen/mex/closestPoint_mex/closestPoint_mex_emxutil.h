/*
 * closestPoint_mex_emxutil.h
 *
 * Code generation for function 'closestPoint_mex_emxutil'
 *
 */

#ifndef __CLOSESTPOINT_MEX_EMXUTIL_H__
#define __CLOSESTPOINT_MEX_EMXUTIL_H__

/* Include files */
#include <math.h>
#include <stdlib.h>
#include <string.h>
#include "mwmathutil.h"
#include "tmwtypes.h"
#include "mex.h"
#include "emlrt.h"
#include "blas.h"
#include "rtwtypes.h"
#include "closestPoint_mex_types.h"

/* Function Declarations */
extern void emxEnsureCapacity(const emlrtStack *sp, emxArray__common *emxArray,
  int32_T oldNumel, int32_T elementSize, const emlrtRTEInfo *srcLocation);
extern void emxFreeStruct_struct0_T(struct0_T *pStruct);
extern void emxInitStruct_struct0_T(const emlrtStack *sp, struct0_T *pStruct,
  const emlrtRTEInfo *srcLocation, boolean_T doPush);

#endif

/* End of code generation (closestPoint_mex_emxutil.h) */
