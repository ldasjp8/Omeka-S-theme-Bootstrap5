<?php

$finder = PhpCsFixer\Finder::create()
    ->exclude('build')
    ->exclude('vendor')
    ->exclude('node_modules')
    ->in(__DIR__);

$config = new PhpCsFixer\Config();
return $config->setRules([
        '@PSR2' => true,
        'array_syntax' => ['syntax' => 'short'],
        'binary_operator_spaces' => ['default' => 'align_single_space_minimal'],
        'cast_spaces' => true,
        'include' => true,
        'no_blank_lines_after_class_opening' => true,
        'no_blank_lines_after_phpdoc' => true,
        'no_extra_blank_lines' => ['tokens' => ['extra']], // 'no_extra_consecutive_blank_lines' の設定が 'no_extra_blank_lines' に変更されました
        'no_leading_import_slash' => true,
        'no_leading_namespace_whitespace' => true,
        'no_trailing_comma_in_singleline_array' => true,
        'no_unused_imports' => true,
        'no_whitespace_in_blank_line' => true,
        'object_operator_without_whitespace' => true,
        'phpdoc_indent' => true,
        'phpdoc_no_empty_return' => false, // 'phpdoc_no_empty_return' の設定は v3 で削除された可能性があります。適切な代替を文書で確認してください
        'phpdoc_scalar' => true,
        'phpdoc_no_useless_inheritdoc' => true, // 'phpdoc_to_comment' の設定はこのように変更されるかもしれません
        'phpdoc_trim' => true,
        'trailing_comma_in_multiline' => ['elements' => ['arrays']], // 'trailing_comma_in_multiline_array' の設定が 'trailing_comma_in_multiline' に変更されました
    ])
    ->setFinder($finder)
    ->setUsingCache(true);