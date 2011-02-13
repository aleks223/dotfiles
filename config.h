/* See LICENSE file for copyright and license details. */

/* appearance */
static const char font[]            = "-misc-fixed-medium-r-*-*-12-*-*-*-*-60-iso8859-*";
static const char normbordercolor[] = "#eeeeee";
static const char normbgcolor[]     = "#eeeeee";
static const char normfgcolor[]     = "#555555";
static const char selbordercolor[]  = "#0066ff";
static const char selbgcolor[]      = "#0066ff";
static const char selfgcolor[]      = "#ffffff";
static const unsigned int borderpx  = 2;        /* border pixel of windows */
static const unsigned int gappx     = 0;        /* gap pixel between windows */
static const unsigned int snap      = 6;       /* snap pixel */
static const Bool showbar           = True;     /* False means no bar */
static const Bool topbar            = True;     /* False means bottom bar */

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5" };

static const Rule rules[] = {
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "MPlayer",        NULL,       NULL,       1 << 2,         True,       -1 },
	{ "XFontSel",       NULL,       NULL,       0,              True,       -1 },
	{ "Xsane",          NULL,       NULL,       0,              True,       -1 },
	{ "Gimp",           NULL,       NULL,       1 << 4,         True,       -1 },
	{ "Thunar",         NULL,       NULL,       0,              False,      -1 },
	{ "Iron",           NULL,       NULL,       1 << 1,         False,      -1 },
	{ "Firefox",        NULL,       NULL,       1 << 1,         False,      -1 },
	{ "XCalc",          NULL,       NULL,       0,              True,       -1 },
	{ "Vlc",            NULL,       NULL,       1 << 2,         True,       -1 },
	{ "Gedit",          NULL,       NULL,       1 << 3,         False,       -1 },
	{ "Gvim",           NULL,       NULL,       1 << 3,         False,       -1 },
	{ NULL,            "ncmpcpp",   NULL,       1 << 2,         False,      -1 },
	{  NULL,           "wicd-client.py", NULL,  0,              False,      -1 },
};

/* layout(s) */
static const float mfact      = 0.55; /* factor of master area size [0.05..0.95] */
static const Bool resizehints = False; /* True means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[T]",      tile },    /* first entry is default */
	{ "[F]",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
 	{ "TTT",      bstack },
 	{ "===",      bstackhoriz },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static const char *dmenucmd[] = { "dmenu_run", "-fn", font, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selbgcolor, "-sf", selfgcolor, NULL };
static const char *termcmd[]  = { "urxvtc", NULL };

static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_x,      spawn,          {.v = dmenucmd } },
	{ MODKEY,                       XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },                   /* toggle statusbar */
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },            /* cycle clients on current tag */
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },            /* cycle clients on current tag */
	{ Mod1Mask,                     XK_Tab,    focusstack,     {.i = +1 } },            /* cycle clients windows-style */
	{ Mod1Mask|ShiftMask,           XK_Tab,    focusstack,     {.i = -1 } },            /* cycle clients windows-style */
	{ MODKEY,                       XK_comma,  setmfact,       {.f = -0.05} },          /* shrink master column */
	{ MODKEY,                       XK_period, setmfact,       {.f = +0.05} },          /* expand master column */
	{ Mod1Mask,                     XK_Return, zoom,           {0} },                   /* toggle client to master column */
	{ MODKEY,                       XK_Tab,    view,           {0} },                   /* toggle last tag */
	{ Mod1Mask,                     XK_q,      killclient,     {0} },                   /* kill selected client */
	{ Mod1Mask,                     XK_b,      setlayout,      {.v = &layouts[3]} },    /* set bottomstack layout */
	{ Mod1Mask,                     XK_t,      setlayout,      {.v = &layouts[1]} },    /* set tile layout */
	{ Mod1Mask,                     XK_f,      setlayout,      {.v = &layouts[2]} },    /* set float layout */
	{ Mod1Mask,                     XK_m,      setlayout,      {.v = &layouts[0]} },    /* set monocle layout */
	{ Mod1Mask,                     XK_space,  setlayout,      {0} },                   /* toggle last layout */
	{ Mod1Mask|ShiftMask,           XK_space,  togglefloating, {0} },                   /* toggle floating on selected client */
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },           /* view all tags */
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },           /* focused client is tagged all */
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} }, /* kill the dwm session */
	{ MODKEY,                       XK_p,      spawn,          SHCMD("exec thunar") },
	{ MODKEY|ShiftMask,             XK_n,      spawn,          SHCMD("exec wicd-client -n") },
	{ MODKEY,                       XK_c,      spawn,          SHCMD("exec iron") },
	{ MODKEY,                       XK_m,      spawn,          SHCMD("exec mpd") },
	{ MODKEY|ShiftMask,             XK_m,      spawn,          SHCMD("exec urxvtc -n mutt -e mutt") },
	{ MODKEY,                       XK_n,      spawn,          SHCMD("exec urxvtc -n ncmpcpp -e ncmpcpp") },
	{ MODKEY,                       XK_v,      spawn,          SHCMD("exec urxvtc -e vim") },
	{ Mod1Mask|ControlMask,         XK_l,      spawn,          SHCMD("exec slock") },
	{ Mod1Mask|ControlMask,         XK_Delete, spawn,          SHCMD("sudo shutdown -r now") },
	{ Mod1Mask|ControlMask,         XK_Insert, spawn,          SHCMD("sudo shutdown -h now") },
	{ MODKEY|ControlMask,		XK_Down,   spawn,	   SHCMD("exec mpc toggle") },
	{ MODKEY|ControlMask,		XK_Right,  spawn,	   SHCMD("exec mpc next") },
	{ MODKEY|ControlMask,		XK_Left,   spawn,	   SHCMD("exec mpc prev") },
	{ MODKEY|ControlMask,		XK_Up,     spawn,	   SHCMD("exec mpc stop") }
};

/* button definitions */
/* click can be ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};
