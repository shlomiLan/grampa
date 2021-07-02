docker rm d7245f33d99642a59a83a4e81848ad29
export GITHUB_WORKSPACE="/github/workspace"
docker build -t d7245f33d99642a59a83a4e81848ad29 -f Dockerfile .
docker run --workdir /github/workspace -e GITHUB_WORKSPACE  -v "/Users/shlomihome/workspace/slots_tracker_server/slots_tracker_server":"/github/workspace" d7245f33d99642a59a83a4e81848ad29

