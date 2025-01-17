#!/bin/sh -eux

export JUNIT_REPORT_DIR=/src/test-results/ginkgo
mkdir -p "${JUNIT_REPORT_DIR}"

make $TEST_TARGET
make eksctl \
    && cp ./eksctl /out/usr/local/bin/eksctl
make eksctl-integration-test \
    && mkdir -p /out/usr/local/share/eksctl \
    && cp integration/*.yaml /out/usr/local/share/eksctl \
    && cp ./eksctl-integration-test /out/usr/local/bin/eksctl-integration-test
