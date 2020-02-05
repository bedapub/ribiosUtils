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


#include <R_ext/Rdynload.h>
#include "R.h"
#include "ribios_base.h"

static const R_CallMethodDef callMethods[] = {
  /* pwdecode.c */
  {NULL, NULL, 0}
};

void R_init_ribiosUtils(DllInfo *info) {
  R_registerRoutines(info, NULL, callMethods, NULL, NULL);
  R_useDynamicSymbols(info, FALSE);
  R_forceSymbols(info, TRUE);
}
