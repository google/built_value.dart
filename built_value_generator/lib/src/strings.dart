/// Escapes dollar signs in a string with backslashes.
String escapeString(String string) => string.replaceAll(r'$', r'\$');
