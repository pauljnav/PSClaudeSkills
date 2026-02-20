<#
.SYNOPSIS
Initialize Claude CLI with your API key.
.DESCRIPTION
Configures the Claude CLI by setting the API key for authentication.
#>
function Invoke-ClaudeInit {
    param (
        [string]$ApiKey
    )
    claude init --api-key $ApiKey
}

<#
.SYNOPSIS
Log in to Claude CLI.
.DESCRIPTION
Starts the interactive login flow to authenticate with your Claude account.
#>
function Invoke-ClaudeLogin {
    param ()
    claude login
}

<#
.SYNOPSIS
Log out from Claude CLI.
.DESCRIPTION
Removes authentication credentials and logs you out of the Claude CLI.
#>
function Invoke-ClaudeLogout {
    param ()
    claude logout
}

<#
.SYNOPSIS
Show the currently authenticated Claude user.
.DESCRIPTION
Displays information about the currently authenticated user in Claude CLI.
#>
function Invoke-ClaudeWhoami {
    param ()
    claude whoami
}

<#
.SYNOPSIS
Show current status.
.DESCRIPTION
Displays information about the current authentication and configuration status.
#>
function Invoke-ClaudeStatus {
    param ()
    claude status
}

<#
.SYNOPSIS
Set a Claude CLI configuration value.
.DESCRIPTION
Sets a specific key-value pair in the Claude CLI configuration.
#>
function Invoke-ClaudeConfigSet {
    param (
        [Parameter(Mandatory=$true)][string]$Key,
        [Parameter(Mandatory=$true)][string]$Value
    )
    claude config set $Key $Value
}

<#
.SYNOPSIS
Get a Claude CLI configuration value.
.DESCRIPTION
Retrieves the value for a specific key from the Claude CLI configuration.
#>
function Invoke-ClaudeConfigGet {
    param (
        [Parameter(Mandatory=$true)][string]$Key
    )
    claude config get $Key
}

<#
.SYNOPSIS
Unset a Claude CLI configuration value.
.DESCRIPTION
Removes a specific key from the Claude CLI configuration.
#>
function Invoke-ClaudeConfigUnset {
    param (
        [Parameter(Mandatory=$true)][string]$Key
    )
    claude config unset $Key
}

<#
.SYNOPSIS
List available Claude models.
.DESCRIPTION
Outputs a list of Claude AI models accessible to your account.
#>
function Invoke-ClaudeModelList {
    param ()
    claude model list
}

<#
.SYNOPSIS
Show details about a specific Claude model.
.DESCRIPTION
Describes the given Claude model by name, including capabilities and usage.
#>
function Invoke-ClaudeModelDescribe {
    param (
        [Parameter(Mandatory=$true)][string]$ModelName
    )
    claude model describe $ModelName
}

<#
.SYNOPSIS
List your Claude conversations.
.DESCRIPTION
Shows all active and previous conversations in your Claude account.
#>
function Invoke-ClaudeListConversations {
    param ()
    claude conversation list
}

<#
.SYNOPSIS
Show details for a conversation.
.DESCRIPTION
Displays messages and information for a specific conversation by conversation ID.
#>
function Invoke-ClaudeShowConversation {
    param (
        [Parameter(Mandatory=$true)][string]$ConversationId
    )
    claude conversation show $ConversationId
}

<#
.SYNOPSIS
Start a new Claude conversation.
.DESCRIPTION
Creates a new conversation thread with an optional model and system prompt.
#>
function Invoke-ClaudeStartConversation {
    param (
        [string]$Model,
        [string]$SystemPrompt
    )
    $args = @()
    if ($Model) { $args += "--model"; $args += $Model }
    if ($SystemPrompt) { $args += "--system-prompt"; $args += $SystemPrompt }
    claude conversation start @args
}

<#
.SYNOPSIS
Send a message to an existing Claude conversation.
.DESCRIPTION
Sends the given message text to the specified conversation ID.
#>
function Invoke-ClaudeMessageSend {
    param (
        [Parameter(Mandatory=$true)][string]$ConversationId,
        [Parameter(Mandatory=$true)][string]$Message
    )
    claude message send $ConversationId $Message
}

<#
.SYNOPSIS
Upload a file as an attachment to a conversation.
.DESCRIPTION
Uploads a local file to the specified conversation for use as context or reference.
#>
function Invoke-ClaudeAttachmentUpload {
    param (
        [Parameter(Mandatory=$true)][string]$ConversationId,
        [Parameter(Mandatory=$true)][string]$FilePath
    )
    claude attachment upload $ConversationId $FilePath
}

<#
.SYNOPSIS
List attachments for a conversation.
.DESCRIPTION
Displays files attached to a given conversation, by conversation ID.
#>
function Invoke-ClaudeAttachmentList {
    param (
        [Parameter(Mandatory=$true)][string]$ConversationId
    )
    claude attachment list $ConversationId
}