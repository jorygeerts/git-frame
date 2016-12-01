#!/usr/bin/env bash

function usage() {
    echo "usage: git frame [--victim-name --victim-email] <command> <args>"
    echo ""
    echo "OPTIONS"
    echo "  --victim-name"
    echo "      Name of your victim. Must be used in combination with --victim-email"
    echo "  --victim-email"
    echo "      E-mail address of your victim. Must be used in combination with --victim-name"
}

victim_name=""
victim_email=""

# actually parse the options and do stuff
while [[ $1 = -?* ]]; do
    case $1 in
        -h|--help)
            usage
            exit 0
            ;;
        --victim-name)
            shift;
            victim_name=$1
            ;;
        --victim-email)
            shift;
            victim_email=$1
            ;;
        *) ;;
    esac

shift
done

`git config --local user.name "$victim_name"`
`git config --local user.email "$victim_email"`

echo `git "${@}"`

`git config --local --unset user.name "$victim_name"`
`git config --local --unset user.email "$victim_email"`