########################################################################

 sudo ./svc.sh status -l

Jul 01 02:49:10 go2pazrapp016.go2.kworld.kpmg.com runsvc.sh[297757]: Error reported in diagnostic logs. Please examine the log for more details.
Jul 01 02:49:10 go2pazrapp016.go2.kworld.kpmg.com runsvc.sh[297757]:     - /adoagents/go2pazrapp016-01/_diag/Agent_20240701-024105-utc.log
Jul 01 03:05:17 go2pazrapp016.go2.kworld.kpmg.com runsvc.sh[297757]: 2024-07-01 03:05:17Z: Agent connect error: The HTTP request timed out after 00:01:40

////////////////////////////////////////////////

tail -n 100 /adoagents/go2pazrapp016-01/_diag/Agent_20240701-024105-utc.log
[2024-07-02 00:48:38Z WARN VisualStudioServices] GET request to https://dev.azure.com/go-infrastructure/_apis/connectionData timed out after 100 seconds.
[2024-07-02 00:48:38Z INFO VisualStudioServices] Finished operation Location.GetConnectionData
[2024-07-02 00:48:38Z INFO AgentServer] Catch exception during connect. 4 attempt left.
[2024-07-02 00:48:38Z ERR  AgentServer] System.TimeoutException: The HTTP request timed out after 00:01:40.
 ---> System.Threading.Tasks.TaskCanceledException: A task was canceled.
   at System.Threading.Tasks.TaskCompletionSourceWithCancellation`1.WaitWithCancellationAsync(CancellationToken cancellationToken)
   at System.Net.Http.HttpConnectionPool.GetHttp11ConnectionAsync(HttpRequestMessage request, Boolean async, CancellationToken cancellationToken)
   at System.Net.Http.HttpConnectionPool.SendWithVersionDetectionAndRetryAsync(HttpRequestMessage request, Boolean async, Boolean doRequestAuth, CancellationToken cancellationToken)
   at System.Net.Http.AuthenticationHelper.SendWithAuthAsync(HttpRequestMessage request, Uri authUri, Boolean async, ICredentials credentials, Boolean preAuthenticate, Boolean isProxyAuth, Boolean doRequestAuth, HttpConnectionPool pool, CancellationToken cancellationToken)
   at System.Net.Http.DecompressionHandler.SendAsync(HttpRequestMessage request, Boolean async, CancellationToken cancellationToken)
   at Microsoft.VisualStudio.Services.Common.VssHttpMessageHandler.SendAsync(HttpRequestMessage request, CancellationToken cancellationToken)
   --- End of inner exception stack trace ---
   at Microsoft.VisualStudio.Services.Common.VssHttpMessageHandler.SendAsync(HttpRequestMessage request, CancellationToken cancellationToken)
   at Microsoft.VisualStudio.Services.Common.VssHttpRetryMessageHandler.SendAsync(HttpRequestMessage request, CancellationToken cancellationToken)
   at System.Net.Http.HttpClient.<SendAsync>g__Core|83_0(HttpRequestMessage request, HttpCompletionOption completionOption, CancellationTokenSource cts, Boolean disposeCts, CancellationTokenSource pendingRequestsCts, CancellationToken originalCancellationToken)
   at Microsoft.VisualStudio.Services.WebApi.VssHttpClientBase.SendAsync(HttpRequestMessage message, HttpCompletionOption completionOption, Object userState, CancellationToken cancellationToken)
   at Microsoft.VisualStudio.Services.WebApi.VssHttpClientBase.SendAsync[T](HttpRequestMessage message, Object userState, CancellationToken cancellationToken)
   at Microsoft.VisualStudio.Services.Location.Client.LocationHttpClient.GetConnectionDataAsync(ConnectOptions connectOptions, Int64 lastChangeId, CancellationToken cancellationToken, Object userState)
   at Microsoft.VisualStudio.Services.WebApi.Location.VssServerDataProvider.GetConnectionDataAsync(ConnectOptions connectOptions, Int32 lastChangeId, CancellationToken cancellationToken)
   at Microsoft.VisualStudio.Services.WebApi.Location.VssServerDataProvider.ConnectAsync(ConnectOptions connectOptions, CancellationToken cancellationToken)
   at Microsoft.VisualStudio.Services.Agent.AgentServer.EstablishVssConnection(Uri serverUrl, VssCredentials credentials, TimeSpan timeout) in /mnt/vss/_work/1/s/src/Microsoft.VisualStudio.Services.Agent/AgentServer.cs:line 216
[2024-07-02 00:48:38Z INFO VisualStudioServices] Starting operation Location.GetConnectionData
[2024-07-02 00:50:18Z WARN VisualStudioServices] GET request to https://dev.azure.com/go-infrastructure/_apis/connectionData timed out after 100 seconds.
[2024-07-02 00:50:18Z INFO VisualStudioServices] Finished operation Location.GetConnectionData
[2024-07-02 00:50:18Z INFO VisualStudioServices] Starting operation Location.GetConnectionData
[2024-07-02 00:50:48Z WARN VisualStudioServices] Attempt 1 of GET request to https://dev.azure.com/go-infrastructure/_apis/connectionData failed (Socket Error: NetworkUnreachable). The operation will be retried in 11.0289706 seconds.
[2024-07-02 00:52:39Z WARN VisualStudioServices] GET request to https://dev.azure.com/go-infrastructure/_apis/connectionData timed out after 100 seconds.
[2024-07-02 00:52:39Z INFO VisualStudioServices] Finished operation Location.GetConnectionData
[2024-07-02 00:52:39Z INFO AgentServer] Catch exception during connect. 3 attempt left.
[2024-07-02 00:52:39Z ERR  AgentServer] System.TimeoutException: The HTTP request timed out after 00:01:40.
 ---> System.Threading.Tasks.TaskCanceledException: A task was canceled.
   at System.Threading.Tasks.TaskCompletionSourceWithCancellation`1.WaitWithCancellationAsync(CancellationToken cancellationToken)
   at System.Net.Http.HttpConnectionPool.GetHttp11ConnectionAsync(HttpRequestMessage request, Boolean async, CancellationToken cancellationToken)
   at System.Net.Http.HttpConnectionPool.SendWithVersionDetectionAndRetryAsync(HttpRequestMessage request, Boolean async, Boolean doRequestAuth, CancellationToken cancellationToken)
   at System.Net.Http.AuthenticationHelper.SendWithAuthAsync(HttpRequestMessage request, Uri authUri, Boolean async, ICredentials credentials, Boolean preAuthenticate, Boolean isProxyAuth, Boolean doRequestAuth, HttpConnectionPool pool, CancellationToken cancellationToken)
   at System.Net.Http.DecompressionHandler.SendAsync(HttpRequestMessage request, Boolean async, CancellationToken cancellationToken)
   at Microsoft.VisualStudio.Services.Common.VssHttpMessageHandler.SendAsync(HttpRequestMessage request, CancellationToken cancellationToken)
   --- End of inner exception stack trace ---
   at Microsoft.VisualStudio.Services.Common.VssHttpMessageHandler.SendAsync(HttpRequestMessage request, CancellationToken cancellationToken)
   at Microsoft.VisualStudio.Services.Common.VssHttpRetryMessageHandler.SendAsync(HttpRequestMessage request, CancellationToken cancellationToken)
   at System.Net.Http.HttpClient.<SendAsync>g__Core|83_0(HttpRequestMessage request, HttpCompletionOption completionOption, CancellationTokenSource cts, Boolean disposeCts, CancellationTokenSource pendingRequestsCts, CancellationToken originalCancellationToken)
   at Microsoft.VisualStudio.Services.WebApi.VssHttpClientBase.SendAsync(HttpRequestMessage message, HttpCompletionOption completionOption, Object userState, CancellationToken cancellationToken)
   at Microsoft.VisualStudio.Services.WebApi.VssHttpClientBase.SendAsync[T](HttpRequestMessage message, Object userState, CancellationToken cancellationToken)
   at Microsoft.VisualStudio.Services.Location.Client.LocationHttpClient.GetConnectionDataAsync(ConnectOptions connectOptions, Int64 lastChangeId, CancellationToken cancellationToken, Object userState)
   at Microsoft.VisualStudio.Services.WebApi.Location.VssServerDataProvider.GetConnectionDataAsync(ConnectOptions connectOptions, Int32 lastChangeId, CancellationToken cancellationToken)
   at Microsoft.VisualStudio.Services.WebApi.Location.VssServerDataProvider.ConnectAsync(ConnectOptions connectOptions, CancellationToken cancellationToken)
   at Microsoft.VisualStudio.Services.Agent.AgentServer.EstablishVssConnection(Uri serverUrl, VssCredentials credentials, TimeSpan timeout) in /mnt/vss/_work/1/s/src/Microsoft.VisualStudio.Services.Agent/AgentServer.cs:line 216
[2024-07-02 00:52:39Z INFO VisualStudioServices] Starting operation Location.GetConnectionData
[2024-07-02 00:54:19Z WARN VisualStudioServices] GET request to https://dev.azure.com/go-infrastructure/_apis/connectionData timed out after 100 seconds.
[2024-07-02 00:54:19Z INFO VisualStudioServices] Finished operation Location.GetConnectionData
[2024-07-02 00:54:19Z INFO VisualStudioServices] Starting operation Location.GetConnectionData
[2024-07-02 00:54:50Z WARN VisualStudioServices] Attempt 1 of GET request to https://dev.azure.com/go-infrastructure/_apis/connectionData failed (Socket Error: NetworkUnreachable). The operation will be retried in 11.0725762 seconds.
[2024-07-02 00:56:41Z WARN VisualStudioServices] GET request to https://dev.azure.com/go-infrastructure/_apis/connectionData timed out after 100 seconds.
[2024-07-02 00:56:41Z INFO VisualStudioServices] Finished operation Location.GetConnectionData
[2024-07-02 00:56:41Z INFO AgentServer] Catch exception during connect. 2 attempt left.
[2024-07-02 00:56:41Z ERR  AgentServer] System.TimeoutException: The HTTP request timed out after 00:01:40.
 ---> System.Threading.Tasks.TaskCanceledException: A task was canceled.
   at System.Threading.Tasks.TaskCompletionSourceWithCancellation`1.WaitWithCancellationAsync(CancellationToken cancellationToken)
   at System.Net.Http.HttpConnectionPool.GetHttp11ConnectionAsync(HttpRequestMessage request, Boolean async, CancellationToken cancellationToken)
   at System.Net.Http.HttpConnectionPool.SendWithVersionDetectionAndRetryAsync(HttpRequestMessage request, Boolean async, Boolean doRequestAuth, CancellationToken cancellationToken)
   at System.Net.Http.AuthenticationHelper.SendWithAuthAsync(HttpRequestMessage request, Uri authUri, Boolean async, ICredentials credentials, Boolean preAuthenticate, Boolean isProxyAuth, Boolean doRequestAuth, HttpConnectionPool pool, CancellationToken cancellationToken)
   at System.Net.Http.DecompressionHandler.SendAsync(HttpRequestMessage request, Boolean async, CancellationToken cancellationToken)
   at Microsoft.VisualStudio.Services.Common.VssHttpMessageHandler.SendAsync(HttpRequestMessage request, CancellationToken cancellationToken)
   --- End of inner exception stack trace ---
   at Microsoft.VisualStudio.Services.Common.VssHttpMessageHandler.SendAsync(HttpRequestMessage request, CancellationToken cancellationToken)
   at Microsoft.VisualStudio.Services.Common.VssHttpRetryMessageHandler.SendAsync(HttpRequestMessage request, CancellationToken cancellationToken)
   at System.Net.Http.HttpClient.<SendAsync>g__Core|83_0(HttpRequestMessage request, HttpCompletionOption completionOption, CancellationTokenSource cts, Boolean disposeCts, CancellationTokenSource pendingRequestsCts, CancellationToken originalCancellationToken)
   at Microsoft.VisualStudio.Services.WebApi.VssHttpClientBase.SendAsync(HttpRequestMessage message, HttpCompletionOption completionOption, Object userState, CancellationToken cancellationToken)
   at Microsoft.VisualStudio.Services.WebApi.VssHttpClientBase.SendAsync[T](HttpRequestMessage message, Object userState, CancellationToken cancellationToken)
   at Microsoft.VisualStudio.Services.Location.Client.LocationHttpClient.GetConnectionDataAsync(ConnectOptions connectOptions, Int64 lastChangeId, CancellationToken cancellationToken, Object userState)
   at Microsoft.VisualStudio.Services.WebApi.Location.VssServerDataProvider.GetConnectionDataAsync(ConnectOptions connectOptions, Int32 lastChangeId, CancellationToken cancellationToken)
   at Microsoft.VisualStudio.Services.WebApi.Location.VssServerDataProvider.ConnectAsync(ConnectOptions connectOptions, CancellationToken cancellationToken)
   at Microsoft.VisualStudio.Services.Agent.AgentServer.EstablishVssConnection(Uri serverUrl, VssCredentials credentials, TimeSpan timeout) in /mnt/vss/_work/1/s/src/Microsoft.VisualStudio.Services.Agent/AgentServer.cs:line 216
[2024-07-02 00:56:41Z INFO VisualStudioServices] Starting operation Location.GetConnectionData
[2024-07-02 00:58:21Z WARN VisualStudioServices] GET request to https://dev.azure.com/go-infrastructure/_apis/connectionData timed out after 100 seconds.
[2024-07-02 00:58:21Z INFO VisualStudioServices] Finished operation Location.GetConnectionData
[2024-07-02 00:58:21Z INFO VisualStudioServices] Starting operation Location.GetConnectionData
[2024-07-02 00:58:52Z WARN VisualStudioServices] Attempt 1 of GET request to https://dev.azure.com/go-infrastructure/_apis/connectionData failed (Socket Error: NetworkUnreachable). The operation will be retried in 11.1631187 seconds.
[2024-07-02 01:00:43Z WARN VisualStudioServices] GET request to https://dev.azure.com/go-infrastructure/_apis/connectionData timed out after 100 seconds.
[2024-07-02 01:00:43Z INFO VisualStudioServices] Finished operation Location.GetConnectionData
[2024-07-02 01:00:43Z INFO AgentServer] Catch exception during connect. 1 attempt left.
[2024-07-02 01:00:43Z ERR  AgentServer] System.TimeoutException: The HTTP request timed out after 00:01:40.
 ---> System.Threading.Tasks.TaskCanceledException: A task was canceled.
   at System.Threading.Tasks.TaskCompletionSourceWithCancellation`1.WaitWithCancellationAsync(CancellationToken cancellationToken)
   at System.Net.Http.HttpConnectionPool.GetHttp11ConnectionAsync(HttpRequestMessage request, Boolean async, CancellationToken cancellationToken)
   at System.Net.Http.HttpConnectionPool.SendWithVersionDetectionAndRetryAsync(HttpRequestMessage request, Boolean async, Boolean doRequestAuth, CancellationToken cancellationToken)
   at System.Net.Http.AuthenticationHelper.SendWithAuthAsync(HttpRequestMessage request, Uri authUri, Boolean async, ICredentials credentials, Boolean preAuthenticate, Boolean isProxyAuth, Boolean doRequestAuth, HttpConnectionPool pool, CancellationToken cancellationToken)
   at System.Net.Http.DecompressionHandler.SendAsync(HttpRequestMessage request, Boolean async, CancellationToken cancellationToken)
   at Microsoft.VisualStudio.Services.Common.VssHttpMessageHandler.SendAsync(HttpRequestMessage request, CancellationToken cancellationToken)
   --- End of inner exception stack trace ---
   at Microsoft.VisualStudio.Services.Common.VssHttpMessageHandler.SendAsync(HttpRequestMessage request, CancellationToken cancellationToken)
   at Microsoft.VisualStudio.Services.Common.VssHttpRetryMessageHandler.SendAsync(HttpRequestMessage request, CancellationToken cancellationToken)
   at System.Net.Http.HttpClient.<SendAsync>g__Core|83_0(HttpRequestMessage request, HttpCompletionOption completionOption, CancellationTokenSource cts, Boolean disposeCts, CancellationTokenSource pendingRequestsCts, CancellationToken originalCancellationToken)
   at Microsoft.VisualStudio.Services.WebApi.VssHttpClientBase.SendAsync(HttpRequestMessage message, HttpCompletionOption completionOption, Object userState, CancellationToken cancellationToken)
   at Microsoft.VisualStudio.Services.WebApi.VssHttpClientBase.SendAsync[T](HttpRequestMessage message, Object userState, CancellationToken cancellationToken)
   at Microsoft.VisualStudio.Services.Location.Client.LocationHttpClient.GetConnectionDataAsync(ConnectOptions connectOptions, Int64 lastChangeId, CancellationToken cancellationToken, Object userState)
   at Microsoft.VisualStudio.Services.WebApi.Location.VssServerDataProvider.GetConnectionDataAsync(ConnectOptions connectOptions, Int32 lastChangeId, CancellationToken cancellationToken)
   at Microsoft.VisualStudio.Services.WebApi.Location.VssServerDataProvider.ConnectAsync(ConnectOptions connectOptions, CancellationToken cancellationToken)
   at Microsoft.VisualStudio.Services.Agent.AgentServer.EstablishVssConnection(Uri serverUrl, VssCredentials credentials, TimeSpan timeout) in /mnt/vss/_work/1/s/src/Microsoft.VisualStudio.Services.Agent/AgentServer.cs:line 216
[2024-07-02 01:00:43Z INFO VisualStudioServices] Starting operation Location.GetConnectionData


/////////////////////////

 cat ./svc.sh
#!/bin/bash

SVC_NAME=`systemd-escape --path "vsts.agent.go-infrastructure.azure-dev-automation-pool.go2pazrapp016-01.service"`
SVC_DESCRIPTION="Azure Pipelines Agent (go-infrastructure.azure-dev-automation-pool.go2pazrapp016-01)"

SVC_CMD=$1
arg_2=${2}

AGENT_ROOT=`pwd`

UNIT_PATH=/etc/systemd/system/${SVC_NAME}
TEMPLATE_PATH=./bin/vsts.agent.service.template
TEMP_PATH=./bin/vsts.agent.service.temp
CONFIG_PATH=.service

user_id=`id -u`

# systemctl must run as sudo
# this script is a convenience wrapper around systemctl
if [ $user_id -ne 0 ]; then
    echo "Must run as sudo"
    exit 1
fi

function failed()
{
   local error=${1:-Undefined error}
   echo "Failed: $error" >&2
   exit 1
}

if [ ! -f "${TEMPLATE_PATH}" ]; then
    failed "Must run from agent root or install is corrupt"
fi

#check if we run as root
if [[ $(id -u) != "0" ]]; then
    echo "Failed: This script requires to run with sudo." >&2
    exit 1
fi

function install()
{
    echo "Creating launch agent in ${UNIT_PATH}"
    if [ -f "${UNIT_PATH}" ]; then
        failed "error: exists ${UNIT_PATH}"
    fi

    if [ -f "${TEMP_PATH}" ]; then
      rm "${TEMP_PATH}" || failed "failed to delete ${TEMP_PATH}"
    fi

    # can optionally use username supplied
    run_as_user=${arg_2:-$SUDO_USER}
    echo "Run as user: ${run_as_user}"

    run_as_uid=$(id -u ${run_as_user}) || failed "User does not exist"
    echo "Run as uid: ${run_as_uid}"

    run_as_gid=$(id -g ${run_as_user}) || failed "Group not available"
    echo "gid: ${run_as_gid}"

    sed "s/{{User}}/${run_as_user}/g; s/{{Description}}/$(echo ${SVC_DESCRIPTION} | sed -e 's/[\/&]/\\&/g')/g; s/{{AgentRoot}}/$(echo ${AGENT_ROOT} | sed -e 's/[\/&]/\\&/g')/g;" "${TEMPLATE_PATH}" > "${TEMP_PATH}" || failed "failed to create replacement temp file"
    mv "${TEMP_PATH}" "${UNIT_PATH}" || failed "failed to copy unit file"

    # unit file should not be executable and world writable
    chmod 664 "${UNIT_PATH}" || failed "failed to set permissions on ${UNIT_PATH}"

    command -v sestatus && sestatus | grep "SELinux status: *enabled"
    is_selinux_enabled=$?
    if [ $is_selinux_enabled -eq 0 ]; then
        # SELinux is enabled, we must ensure the system context for the unit file matches the expected systemd_unit_file context.
        chcon system_u:object_r:systemd_unit_file_t:s0 "${UNIT_PATH}"
    fi
    systemctl daemon-reload || failed "failed to reload daemons"

    # Since we started with sudo, runsvc.sh will be owned by root. Change this to current login user.
    cp ./bin/runsvc.sh ./runsvc.sh || failed "failed to copy runsvc.sh"
    chown ${run_as_uid}:${run_as_gid} ./runsvc.sh || failed "failed to set owner for runsvc.sh"
    chmod 755 ./runsvc.sh || failed "failed to set permission for runsvc.sh"
    if [ $is_selinux_enabled -eq 0 ]; then
        # SELinux is enabled, we must ensure the shell scripts matches the expected context.
        chcon system_u:object_r:usr_t:s0 runsvc.sh
    fi

    systemctl enable ${SVC_NAME} || failed "failed to enable ${SVC_NAME}"

    echo "${SVC_NAME}" > ${CONFIG_PATH} || failed "failed to create .service file"
    chown ${run_as_uid}:${run_as_gid} ${CONFIG_PATH} || failed "failed to set permission for ${CONFIG_PATH}"
}

function start()
{
    systemctl start ${SVC_NAME} || failed "failed to start ${SVC_NAME}"
    status
}

function stop()
{
    systemctl stop ${SVC_NAME} || failed "failed to stop ${SVC_NAME}"
    status
}

function uninstall()
{
    stop
    systemctl disable ${SVC_NAME} || failed "failed to disable  ${SVC_NAME}"
    rm "${UNIT_PATH}" || failed "failed to delete ${UNIT_PATH}"
    if [ -f "${CONFIG_PATH}" ]; then
      rm "${CONFIG_PATH}" || failed "failed to delete ${CONFIG_PATH}"
    fi
    systemctl daemon-reload || failed "failed to reload daemons"
}

function status()
{
    if [ -f "${UNIT_PATH}" ]; then
        echo
        echo "${UNIT_PATH}"
    else
        echo
        echo "not installed"
        echo
        return
    fi

    systemctl --no-pager status ${SVC_NAME}
}

function usage()
{
    echo
    echo Usage:
    echo "./svc.sh [install, start, stop, status, uninstall]"
    echo "Commands:"
    echo "   install [user]: Install agent service as Root or specified user."
    echo "   start: Manually start the agent service."
    echo "   stop: Manually stop the agent service."
    echo "   status: Display status of agent service."
    echo "   uninstall: Uninstall agent service."
    echo
}

case $SVC_CMD in
   "install") install;;
   "status") status;;
   "uninstall") uninstall;;
   "start") start;;
   "stop") stop;;
   "status") status;;
   *) usage;;
esac

exit 0

///////////////////////////////////////////////


cat ./runsvc.sh
#!/bin/bash

# convert SIGTERM signal to SIGINT
# for more info on how to propagate SIGTERM to a child process see: http://veithen.github.io/2014/11/16/sigterm-propagation.html
trap 'kill -INT $PID' TERM INT

if [ -f ".path" ]; then
    # configure
    export PATH=`cat .path`
    echo ".path=${PATH}"
fi

# insert anything to setup env when running as a service

# fallback on Node16 if Node20 is not supported by the host
./externals/node20_1/bin/node --version
if [ $? == 0 ]; then
    NODE_VER="node20_1"
else
    NODE_VER="node16"
fi

# run the host process which keep the listener alive
./externals/"$NODE_VER"/bin/node ./bin/AgentService.js &
PID=$!
wait $PID
trap - TERM INT
wait $PID

///////////////////////////////////////////////////





