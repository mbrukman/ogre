%module(directors="1") OgreBites
%{
/* Includes the header in the wrapper code */
#include "Ogre.h"
#include "OgreBuildSettings.h"
#include "OgreApplicationContext.h"
#include "OgreSGTechniqueResolverListener.h"
#include "OgreCameraMan.h"
#include "OgreTrays.h"

#if OGRE_BITES_HAVE_SDL
#include "SDL_stdinc.h"
#include "SDL_events.h"
#include "SDL_keyboard.h"
#include "SDL_keycode.h"
#endif
%}

%include std_string.i
%include exception.i 
%include stdint.i
%import "Ogre.i"

#define _OgreBitesExport

#if OGRE_BITES_HAVE_SDL
#define DECLSPEC
#define SDLCALL
#define SDL_FORCE_INLINE
%ignore SDL_vsscanf;
%ignore SDL_vsnprintf;
%include "SDL_stdinc.h"
%include "SDL_keyboard.h"

// tell SWIG that we need ints here
%warnfilter(302) SDLK_ESCAPE;
%warnfilter(302) SDLK_RETURN;
%warnfilter(302) SDLK_SPACE;
%constant int SDLK_ESCAPE;
%constant int SDLK_RETURN;
%constant int SDLK_SPACE;
%include "SDL_keycode.h"

%include "SDL_events.h"
#endif

%include "OgreInput.h"
%include "OgreSGTechniqueResolverListener.h"
%include "OgreCameraMan.h"
%include "OgreWindowEventUtilities.h"
%feature("director") OgreBites::ApplicationContext;
%include "OgreApplicationContext.h"
%include "OgreTrays.h"