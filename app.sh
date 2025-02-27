#!/usr/bin/env sh
#
# This script is run by OpenShift's s2i. Here we guarantee that we run desired
# command
#

set -o nounset
set -o errexit
set -o errtrace
set -o pipefail
trap 'echo "Aborting due to errexit on line $LINENO. Exit code: $?" >&2' ERR

THOTH_WORKFLOW_TASK=${THOTH_WORKFLOW_TASK:?'THOTH_WORKFLOW_TASK is not selected!'}

if [ "$THOTH_WORKFLOW_TASK" = "create_inspection_complete_message" ]; then
    exec python3 create_inspection_complete_message.py
elif [ "$THOTH_WORKFLOW_TASK" = "create_purge_issues" ]; then
    exec python3 create_purge_issues.py
elif [ "$THOTH_WORKFLOW_TASK" = "download_package" ]; then
    exec python3 download_py_package.py
elif [ "$THOTH_WORKFLOW_TASK" = "graph_schema_update" ]; then
    exec python3 graph_schema_update.py
elif [ "$THOTH_WORKFLOW_TASK" = "kebechet_administrator" ]; then
    exec python3 kebechet_administrator.py
elif [ "$THOTH_WORKFLOW_TASK" = "parse_solver_output" ]; then
    exec python3 parse_solver_output.py
elif [ "$THOTH_WORKFLOW_TASK" = "parse_adviser_output" ]; then
    exec python3 parse_adviser_output.py
elif [ "$THOTH_WORKFLOW_TASK" = "parse_provenance_checker_output" ]; then
    exec python3 parse_provenance_checker_output.py
elif [ "$THOTH_WORKFLOW_TASK" = "thoth_repository_initialization" ]; then
    exec python3 thoth_repository_initialization/fork_and_advise.py
elif [ "$THOTH_WORKFLOW_TASK" = "trigger_integration" ]; then
    exec python3 select_thoth_integration.py
elif [ "$THOTH_WORKFLOW_TASK" = "update_kebechet_installation" ]; then
    exec python3 update_keb_installation.py
fi
