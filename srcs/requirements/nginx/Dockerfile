
# parser directives i.e. # escape=` (backtick)

# ARG may be the only command preceeding
FROM debian:buster

RUN apt update \
&& apt install nginx -y

# second from run can be used
# RUN ["executable", "param1", "param2"] (if you use that read the rulse again)
# The default shell for the shell form can be changed using the SHELL command.


COPY . code/

# CMD ["executable","param1","param2"] (exec form, this is the preferred form)
# CMD ["param1","param2"] (as default parameters to ENTRYPOINT)
# CMD command param1 param2 (shell form)

CMD ["nginx", "-g", "daemon off;"]
# docker run -dp 443:80 test (do i need -it/)

# docker exec -it <container name> /bin/bas
