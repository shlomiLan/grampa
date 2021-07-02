import logging
import os

from git import Repo, Git, Tree


def run():
    folder_path = os.environ['GITHUB_WORKSPACE']
    repo = Repo(folder_path)
    g = Git(folder_path)

    all_files = []
    for entry in repo.commit().tree.traverse():
        if isinstance(entry, Tree):
            continue

        loginfo = g.log('-1', '--pretty="%ct"', entry.path)
        logging.debug(f'File: {entry.path} was last updated on: {loginfo}')
        all_files.append([entry.path, loginfo])

    all_files = sorted(all_files, key=lambda x: x[1], reverse=True)
    print(all_files)
    return all_files


if __name__ == "__main__":
    kkkk
    run()
