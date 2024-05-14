string(REGEX REPLACE "^([0-9]+)[.]([0-9]+)[.]([0-9]+)[.]([0-9]+)" "\\1,0\\2,0\\3,0\\4," SQLITE_VERSION "${VERSION}.0")
string(REGEX REPLACE "^([0-9]+),0*([0-9][0-9]),0*([0-9][0-9]),0*([0-9][0-9])," "\\1\\2\\3\\4" SQLITE_VERSION "${SQLITE_VERSION}")

vcpkg_download_distfile(ARCHIVE
    URLS "https://www.sqlite.org/2023/sqlite-autoconf-${SQLITE_VERSION}.tar.gz"
    FILENAME "sqlite-autoconf-${SQLITE_VERSION}.zip"
    SHA512 f54a8993433b4787dde99b11754f26cb525389446f12c78100b47ed342933385c819621c5384387aec7be68aed92d729acb1e5391d3c786f4f9cf1c767a743bd
)

vcpkg_extract_source_archive(
    SOURCE_PATH
    ARCHIVE "${ARCHIVE}"
)


file(COPY "${SOURCE_PATH}/shell.c" DESTINATION "${CURRENT_PACKAGES_DIR}/msbuild-sqlite3-test")
file(COPY "${SOURCE_PATH}/sqlite3.c" DESTINATION "${CURRENT_PACKAGES_DIR}/msbuild-sqlite3-test")
file(COPY "${SOURCE_PATH}/sqlite3.h" DESTINATION "${CURRENT_PACKAGES_DIR}/msbuild-sqlite3-test")
file(COPY "${SOURCE_PATH}/sqlite3ext.h" DESTINATION "${CURRENT_PACKAGES_DIR}/msbuild-sqlite3-test")
file(COPY "${SOURCE_PATH}/sqlite3.h" DESTINATION "${CURRENT_PACKAGES_DIR}/include")
file(COPY "${SOURCE_PATH}/sqlite3ext.h" DESTINATION "${CURRENT_PACKAGES_DIR}/include")
file(WRITE "${CURRENT_PACKAGES_DIR}/share/${PORT}/copyright" "SQLite is in the Public Domain.\nhttp://www.sqlite.org/copyright.html\n")