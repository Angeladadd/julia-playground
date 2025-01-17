using Sockets

errormonitor(@async begin
    server = listen(ip"127.0.0.1", 2001)
    while true
        sock = accept(server)
        println("Accepted connection from ", sock)
        @async while isopen(sock)
            write(sock, readline(sock, keep=true))
        end
    end
end)

sleep(1)
client = connect(ip"127.0.0.1", 2001)
errormonitor(@async while isopen(client)
    write(stdout, readline(client, keep=true))
end)
println(client, "Hello, world!")
sleep(1)
close(client)