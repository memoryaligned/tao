import argparse
import sys

# from crawl.command.ACTION import callback_fn


def _get_argparse(args):
    parser = argparse.ArgumentParser(prog="crawl")
    subparsers = parser.add_subparsers(help="available subcommands")

    # first sub-command
    assessor_parser = subparsers.add_parser("assessor", help="Assessor commands")
    assessor_parser.add_argument("-s", "--street-file", action="store_true")

    args = parser.parse_args(args)
    return args


def main():
    args = _get_argparse(sys.argv[1:])

    # if "ACTION" in args and arg.ACTION:
    #     callback_fn()
