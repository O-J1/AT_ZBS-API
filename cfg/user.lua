api = {'at'}
styles = loadfile('cfg/tomorrow.lua')('TomorrowNightEighties')
stylesoutshell = styles -- apply the same scheme to Output/Console windows
styles.auxwindow = styles.text -- apply text colors to auxiliary windows
styles.calltip = styles.text -- apply text colors to tooltips
styles['keywords3'] = {fg = {204, 153, 204}, u = true, i = true} 
styles['keywords4'] = {fg = {204, 205, 76}, u = true }
styles['keywords5'] = {fg = {204, 205, 76}, u = true }
styles['keywords6'] = {fg = {218, 86, 86}} 
