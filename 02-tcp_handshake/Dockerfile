FROM eclipsetitan:7.1.1
ENV TEST_NAME=tcp_handshake

ADD --chown=titan:root \
            https://raw.githubusercontent.com/eclipse/titan.ProtocolModules.TCP/master/src/TCP_EncDec.cc \
            https://raw.githubusercontent.com/eclipse/titan.ProtocolModules.TCP/master/src/TCP_Types.ttcn \
            https://raw.githubusercontent.com/eclipse/titan.ProtocolModules.IP/master/src/IP_EncDec.cc \
            https://raw.githubusercontent.com/eclipse/titan.ProtocolModules.IP/master/src/IP_Types.ttcn \
            https://raw.githubusercontent.com/eclipse/titan.TestPorts.LANL2asp/master/src/LANL2asp_PortType.ttcn \
            https://raw.githubusercontent.com/eclipse/titan.TestPorts.LANL2asp/master/src/LANL2asp_Types.ttcn \
            https://raw.githubusercontent.com/eclipse/titan.ProtocolModules.COMMON/master/src/General_Types.ttcn \
            https://raw.githubusercontent.com/ntoofu/titan.TestPorts.LANL2asp/master/src/LANL2asp_PT.cc \
            https://raw.githubusercontent.com/ntoofu/titan.TestPorts.LANL2asp/master/src/LANL2asp_PT.hh \
            ./
COPY entrypoint.sh /entrypoint.sh
COPY ${TEST_NAME}.ttcn .
RUN \
        ttcn3_compiler -t $(find . -type f -maxdepth 1 -name "*.ttcn" -o -name "*.asn") && \
        ttcn3_makefilegen -e ${TEST_NAME} *.ttcn *.cc *.hh && \
        sed -i -e '/^LINUX_LIBS/ s/$/ -lpcap/' Makefile && \
        make
ENTRYPOINT ["/entrypoint.sh"]
