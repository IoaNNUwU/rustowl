# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_rustowl_global_optspecs
	string join \n stdio h/help V/version
end

function __fish_rustowl_needs_command
	# Figure out if the current invocation already has a command.
	set -l cmd (commandline -opc)
	set -e cmd[1]
	argparse -s (__fish_rustowl_global_optspecs) -- $cmd 2>/dev/null
	or return
	if set -q argv[1]
		# Also print the command, so this can be used to figure out what it is.
		echo $argv[1]
		return 1
	end
	return 0
end

function __fish_rustowl_using_subcommand
	set -l cmd (__fish_rustowl_needs_command)
	test -z "$cmd"
	and return 1
	contains -- $cmd[1] $argv
end

complete -c rustowl -n "__fish_rustowl_needs_command" -l stdio
complete -c rustowl -n "__fish_rustowl_needs_command" -s h -l help -d 'Print help'
complete -c rustowl -n "__fish_rustowl_needs_command" -s V -l version -d 'Print version'
complete -c rustowl -n "__fish_rustowl_needs_command" -f -a "check"
complete -c rustowl -n "__fish_rustowl_needs_command" -f -a "clean"
complete -c rustowl -n "__fish_rustowl_needs_command" -f -a "toolchain"
complete -c rustowl -n "__fish_rustowl_needs_command" -f -a "completions" -d 'Generate shell completions'
complete -c rustowl -n "__fish_rustowl_needs_command" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c rustowl -n "__fish_rustowl_using_subcommand check" -l log -r
complete -c rustowl -n "__fish_rustowl_using_subcommand check" -s h -l help -d 'Print help'
complete -c rustowl -n "__fish_rustowl_using_subcommand clean" -s h -l help -d 'Print help'
complete -c rustowl -n "__fish_rustowl_using_subcommand toolchain; and not __fish_seen_subcommand_from install uninstall help" -s h -l help -d 'Print help'
complete -c rustowl -n "__fish_rustowl_using_subcommand toolchain; and not __fish_seen_subcommand_from install uninstall help" -f -a "install"
complete -c rustowl -n "__fish_rustowl_using_subcommand toolchain; and not __fish_seen_subcommand_from install uninstall help" -f -a "uninstall"
complete -c rustowl -n "__fish_rustowl_using_subcommand toolchain; and not __fish_seen_subcommand_from install uninstall help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c rustowl -n "__fish_rustowl_using_subcommand toolchain; and __fish_seen_subcommand_from install" -s h -l help -d 'Print help'
complete -c rustowl -n "__fish_rustowl_using_subcommand toolchain; and __fish_seen_subcommand_from uninstall" -s h -l help -d 'Print help'
complete -c rustowl -n "__fish_rustowl_using_subcommand toolchain; and __fish_seen_subcommand_from help" -f -a "install"
complete -c rustowl -n "__fish_rustowl_using_subcommand toolchain; and __fish_seen_subcommand_from help" -f -a "uninstall"
complete -c rustowl -n "__fish_rustowl_using_subcommand toolchain; and __fish_seen_subcommand_from help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c rustowl -n "__fish_rustowl_using_subcommand completions" -s h -l help -d 'Print help'
complete -c rustowl -n "__fish_rustowl_using_subcommand help; and not __fish_seen_subcommand_from check clean toolchain completions help" -f -a "check"
complete -c rustowl -n "__fish_rustowl_using_subcommand help; and not __fish_seen_subcommand_from check clean toolchain completions help" -f -a "clean"
complete -c rustowl -n "__fish_rustowl_using_subcommand help; and not __fish_seen_subcommand_from check clean toolchain completions help" -f -a "toolchain"
complete -c rustowl -n "__fish_rustowl_using_subcommand help; and not __fish_seen_subcommand_from check clean toolchain completions help" -f -a "completions" -d 'Generate shell completions'
complete -c rustowl -n "__fish_rustowl_using_subcommand help; and not __fish_seen_subcommand_from check clean toolchain completions help" -f -a "help" -d 'Print this message or the help of the given subcommand(s)'
complete -c rustowl -n "__fish_rustowl_using_subcommand help; and __fish_seen_subcommand_from toolchain" -f -a "install"
complete -c rustowl -n "__fish_rustowl_using_subcommand help; and __fish_seen_subcommand_from toolchain" -f -a "uninstall"
