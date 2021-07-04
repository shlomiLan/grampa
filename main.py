import logging
import os
import time

from git import Repo, Git, Tree
from tabulate import tabulate

MAX_RESULTS = 100


def run():
    folder_path = os.environ['GITHUB_WORKSPACE']
    repo = Repo(folder_path)
    g = Git(folder_path)

    all_files = []
    for entry in repo.commit().tree.traverse():
        if isinstance(entry, Tree):
            continue

        loginfo = g.log('-1', '--pretty=%ct', entry.path)
        loginfo_as_date = time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(int(loginfo)))
        logging.debug(f'File: {entry.path} was last updated on: {loginfo_as_date}')
        all_files.append([entry.path, loginfo_as_date])

    all_files = sorted(all_files, key=lambda x: x[1], reverse=True)

    print(tabulate(all_files[:MAX_RESULTS], headers=["File name", "Last changed"], tablefmt="grid"))


if __name__ == "__main__":
    run()
