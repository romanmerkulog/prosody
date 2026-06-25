FROM prosodyim/prosody:13.0

USER root
RUN apt update; \
    apt install -yq lua-luaossl lua-sec; \
    luarocks install luassl || true

RUN prosodyctl install --server=https://modules.prosody.im/rocks/ mod_cloud_notify_encrypted; \
    prosodyctl install --server=https://modules.prosody.im/rocks/ mod_cloud_notify_filters; \
    prosodyctl install --server=https://modules.prosody.im/rocks/ mod_cloud_notify_priority_tag; \
    prosodyctl install --server=https://modules.prosody.im/rocks/ mod_cloud_notify_extensions
