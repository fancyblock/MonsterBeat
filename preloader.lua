-- notice the order of requirement

-- resource manager
require('res')

-- helper
require('utils')

-- layout common
require('layout')

-- model
require( utils.modelpath('preloader') )

-- ui
require( utils.uipath('preloader') )

-- game
require( utils.gamepath('preloader_game') )
