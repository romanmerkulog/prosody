FROM prosodyim/prosody:13.0

USER root
RUN apt update; \
    apt install -yq lua-luaossl luarocks; \
    luarocks install luassl || true

RUN prosodyctl install --server=https://modules.prosody.im/rocks/ mod_cloud_notify_extensions; \
    prosodyctl install --server=https://modules.prosody.im/rocks/ mod_admin_shell; \
    prosodyctl install --server=https://modules.prosody.im/rocks/ mod_cloud_notify_filters; \
    prosodyctl install --server=https://modules.prosody.im/rocks/ mod_cloud_notify_priority_tag
