Set-Location C:\Users\Colum\Desktop


##############################################################################
#.SYNOPSIS
# The all-important Prompt function called by PowerShell in order to display
# the prompt, with an added twist using the built-in parameters.
#
#.DESCRIPTION
# Customizing the prompt is common in PowerShell, but this function adds some
# parameters to the function that enable some dynamic behavior. These
# parameters will not affect the way PowerShell calls the function, but they
# allow you to minimize or hide the prompt by passing switches.
#
#.PARAMETER Minimize
# Shrinks the prompt so that it shows "PS HTP>".
#
#.PARAMETER Hide
# Sets the prompt to an ultra-compact mode, displaying only an indicator,
# and no information about the current location.
#
#.PARAMETER New
# New and improved prompt. HACK THE PLANET!!! I AM THE HACKER KNOWN AS 4CHAN!!!
#
#.PARAMETER Date
# Shows the current date and time.
#
#.PARAMETER Default
# Shows the defeault Powershell prompt of your current directory.
#
#.LINK
# about_prompts
#
#.EXAMPLE
# Prompt -Minimize
# Prompt -Hide
# Prompt -Show
##############################################################################
Function Prompt {
    [CmdletBinding(DefaultParameterSetName='Prompt')]
    param (

        [Parameter(ParameterSetName='Date')]
        [Switch] $Date,

	[Parameter(ParameterSetName='Default')]
        [Switch] $Default,

        [Parameter(ParameterSetName='Minimize')]
        [Switch] $Minimize,

        [Parameter(ParameterSetName='Hide')]
        [Switch] $Hide,

        [Parameter(ParameterSetName='New')]
        [Switch] $New

    )

    switch ( $PSCmdlet.ParameterSetName ) {
		Default { $Global:PromptVisibility = 'Leaf' }
		Date { $Global:PromptVisibility = 'Date' }
		Minimize { $Global:PromptVisibility = 'Minimize' }
		Hide     { $Global:PromptVisibility = 'Hidden' }
		New     { $Global:PromptVisibility = 'Default' }
		Prompt   {
			switch ( $PromptVisibility ) {
				Leaf 		{ "PS $PWD> " }
				Hidden    	{ "> " }
				Minimize 	{ "PS HTP> " }
				Date 		{ "PS $(get-date -uformat %Y-%m-%d` %H`:%M`:%S)> " }
				Default   	{ "Hack the Planet> " }
            }
        }
    }
}
