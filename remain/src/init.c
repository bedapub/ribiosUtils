/* -*- mode: C; c-indent-level: 4; c-basic-offset: 4; indent-tabs-mode: nil; -*- */
/*
 *  ribiosBase -- The base package of the ribios software suite
 *
 *  Copyright (C) 2019  Jitao David Zhang
 *
 *  This file is part of ribiosBase.
 *
 *  ribiosBase is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  ribiosBase is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with ribiosBase.  If not, see <http://www.gnu.org/licenses/>.
 */


#include "R.h"
#include "Rinternals.h"
#include "R_ext/Rdynload.h"

#include "ribios_base.h"

/* definitions of functions provided for .Call() */
static const R_CallMethodDef callMethods[] = {
  {NULL, NULL, 0}
};

/* definition of functions to be exported */
void R_init_ribiosBase(DllInfo *info) {

  /* register routines to be called by R code */
  R_registerRoutines(info, NULL, callMethods, NULL, NULL);
  
  /* the line below says that the DLL is not to be searched
   * for entry points specified by character strings so
   * .C etc calls will only find registered symbols
   */  
  R_useDynamicSymbols(info, FALSE); 

  /* R_forceSymbols call only allows .C etc calls which 
   * specify entry points by R objects such as C_routineName
   * (and not by character strings)
   */ 
  R_forceSymbols(info, TRUE); 
}
