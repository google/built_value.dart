/// Escapes dollar signs in a string with backslashes.
String escapeString(String string) => string.replaceAll(r'$', r'\$');

/// Strips off any trailing `?`.
String stripNullabilitySuffix(String string) =>
    string.endsWith('?') ? string.substring(0, string.length - 1) : string;
