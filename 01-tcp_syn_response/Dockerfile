FROM eclipsetitan/titan-alpine:6.4.0
ENV TEST_NAME=tcp_syn_response

RUN sudo apk add libpcap-dev libcrypto1.0
ADD --chown=titan:root https://raw.githubusercontent.com/eclipse/titan.ProtocolModules.TCP/master/src/TCP_EncDec.cc https://raw.githubusercontent.com/eclipse/titan.ProtocolModules.TCP/master/src/TCP_Types.ttcn https://raw.githubusercontent.com/eclipse/titan.ProtocolModules.IP/master/src/IP_EncDec.cc https://raw.githubusercontent.com/eclipse/titan.ProtocolModules.IP/master/src/IP_Types.ttcn https://raw.githubusercontent.com/eclipse/titan.TestPorts.LANL2asp/master/src/LANL2asp_PT.cc https://raw.githubusercontent.com/eclipse/titan.TestPorts.LANL2asp/master/src/LANL2asp_PT.hh https://raw.githubusercontent.com/eclipse/titan.TestPorts.LANL2asp/master/src/LANL2asp_PortType.ttcn https://raw.githubusercontent.com/eclipse/titan.TestPorts.LANL2asp/master/src/LANL2asp_Types.ttcn https://raw.githubusercontent.com/eclipse/titan.ProtocolModules.COMMON/master/src/General_Types.ttcn ./

COPY entrypoint.sh /entrypoint.sh
COPY ${TEST_NAME}.ttcn .
RUN \
        ttcn3_makefilegen -e ${TEST_NAME} *.ttcn *.cc *.hh && \
        sed -i -e '/^LINUX_LIBS/ s/$/ -lpcap/' Makefile && \
        make
ENTRYPOINT ["/entrypoint.sh"]
