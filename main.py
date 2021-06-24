from git import Repo, Git, Tree


def run():
    folder_path = '/Users/shlomihome/workspace/slots_tracker_server'
    repo = Repo(folder_path)
    g = Git(folder_path)

    all_files = []
    for entry in repo.commit().tree.traverse():
        if isinstance(entry, Tree):
            continue

        loginfo = g.log('-1', '--pretty="%ct"', entry.path)
        print(f'File: {entry.path} was last updated on: {loginfo}')
        all_files.append([entry.path, loginfo])

    print(all_files[0])
    all_files = sorted(all_files, key=lambda x: x[1], reverse=True)
    print(all_files[0])


if __name__ == "__main__":
    run()
