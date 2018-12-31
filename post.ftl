<#include "header.ftl">
<#import "functions.ftl" as fun>
<@header title="${post.postTitle!} | ${options.blog_title!}" keywords="${post.postTitle},${options.seo_keywords!},${tagWords}" description="${post.postSummary!}"></@header>

<#if (options.pinghsu_style_post_picture!'false') == 'true'>
    <div class="post-header-thumb <#if (options.pinghsu_style_post_color!'false') == 'false'> bg-deepgrey<#else >bg-<@fun.randBgColor/></#if>"
         style="background-image:url(<?php parseFieldsThumb($this); ?>);">
        <div class="post-header-thumb-op" style="background-image:url(<?php parseFieldsThumb($this); ?>);"></div>
        <div class="post-header-thumb-cover">
            <div class="post-header-thumb-container">
                <div class="post-header-thumb-title">
                    ${post.postTitle!}
                </div>
                <div class="post-header-thumb-meta">
                    <time datetime="<?php $this->date('c'); ?>" itemprop="datePublished">
                        发布于 ${post.postDate?string('MMM d,yyyy')}
                    </time>
                    in
                    <#if post.categories?? && post.categories?size gt 0>
                        <a href="/categories/${post.categories[0].cateUrl}">${post.categories[0].cateName}</a>
                    </#if>
                    with <a href="#comments">${post.comments?size} 评论</a>
                </div>
                <div class="post-tags">
                    <?php $this->tags(' ', true, ''); ?>
                </div>
            </div>
        </div>
    </div>
<#else>
    <#if post.postThumbnail??>
        <div class="post-header-thumb <#if (options.pinghsu_style_post_color!'false') == 'false'> bg-deepgrey<#else >bg-<@fun.randBgColor/></#if>">
            <div class="post-header-thumb-op" style="background-image:url(${post.postThumbnail});"></div>
            <div class="post-header-thumb-cover">
                <div class="post-header-thumb-container">
                    <div class="post-header-thumb-title">
                        ${post.postTitle!}
                    </div>
                    <div class="post-header-thumb-meta">
                        <time datetime="${post.postDate}" itemprop="datePublished">
                            发布于 ${post.postDate?string('MMM d,yyyy')}
                        </time>
                        in
                        <#if post.categories?? && post.categories?size gt 0>
                            <a href="/categories/${post.categories[0].cateUrl}">${post.categories[0].cateName}</a>
                        </#if>
                        with <a href="#comments">${post.comments?size} 评论</a>
                    </div>
                    <div class="post-tags">
                        <?php $this->tags(' ', true, ''); ?>
                    </div>
                </div>
            </div>
        </div>
    <#else>
        <div class="post-header-thumb <#if (options.pinghsu_style_post_color!'false') == 'false'> bg-deepgrey<#else >bg-<@fun.randBgColor/></#if>">
            <div class="post-header-thumb-op" style="background-image:url(/${themeName}/source/thumbs/<@fun.randThumbs />);"></div>
            <div class="post-header-thumb-cover">
                <div class="post-header-thumb-container">
                    <div class="post-header-thumb-title">
                        <?php $this->title() ?>
                    </div>
                    <div class="post-header-thumb-meta">
                        <time datetime="${post.postDate}" itemprop="datePublished">
                            发布于 ${post.postDate?string('MMM d,yyyy')}
                        </time>
                        in
                        <#if post.categories?? && post.categories?size gt 0>
                            <a href="/categories/${post.categories[0].cateUrl}">${post.categories[0].cateName}</a>
                        </#if>
                        with <a href="#comments">${post.comments?size} 评论</a>
                    </div>
                    <div class="post-tags">
                        <?php $this->tags(' ', true, ''); ?>
                    </div>
                </div>
            </div>
        </div>
    </#if>
</#if>

    <article class="main-content <#if (options.pinghsu_style_post_picture!'false') == 'true'>post-page<#else>page-page</#if>" itemscope itemtype="http://schema.org/Article">
        <div class="post-header">
            <h1 class="post-title" itemprop="name headline">
                ${post.postTitle!}
            </h1>
            <div class="post-data">
                <time datetime="${post.postDate}" itemprop="datePublished">
                    发布于 ${post.postDate?string('MMM d,yyyy')}
                </time>
                in
                <#if post.categories?? && post.categories?size gt 0>
                    <a href="/categories/${post.categories[0].cateUrl}">${post.categories[0].cateName}</a>
                </#if>
                with <a href="#comments">${post.comments?size} 评论</a>
            </div>
        </div>
        <div id="post-content" class="post-content" itemprop="articleBody">
            <p class="post-tags">
                <?php $this->tags(' ', true, ''); ?>
            </p>
            ${post.postContent!}
            <p class="post-info">
                本文由 <a href="/archives/${post.postUrl!}">${user.userDisplayName!}</a> 创作，采用 <a href="https://creativecommons.org/licenses/by/4.0/" target="_blank" rel="external nofollow">知识共享署名4.0</a>
                国际许可协议进行许可<br>本站文章除注明转载/出处外，均为本站原创或翻译，转载前请务必署名<br>最后编辑时间为: ${post.postUpdate?string('MMM d,yyyy HH:mm')}
            </p>
        </div>
    </article>

    <div id="post-bottom-bar" class="post-bottom-bar">
        <div class="bottom-bar-inner">
            <div class="bottom-bar-items social-share left">
                <span class="bottom-bar-item">Share : </span>
                <span class="bottom-bar-item bottom-bar-facebook">
                    <a href="https://www.facebook.com/sharer/sharer.php?u=${options.blog_url!}/archives/${post.postUrl!}" target="_blank" title="${post.postTitle!}" rel="nofollow">facebook</a>
                </span>
                <span class="bottom-bar-item bottom-bar-twitter">
                    <a href="https://twitter.com/intent/tweet?url=${options.blog_url!}/archives/${post.postUrl!}&text=${post.postTitle!}" target="_blank" title="${post.postTitle!}" rel="nofollow">Twitter</a>
                </span>
                <span class="bottom-bar-item bottom-bar-weibo">
                    <a href="http://service.weibo.com/share/share.php?url=${options.blog_url!}/archives/${post.postUrl!}&amp;title=${post.postTitle!}"
                        target="_blank" title="${post.postTitle!}" rel="nofollow">Weibo</a>
                </span>
                <span class="bottom-bar-item bottom-bar-qrcode">
                    <a href="//pan.baidu.com/share/qrcode?w=300&amp;h=300&amp;url=${options.blog_url!}/archives/${post.postUrl!}" target="_blank" rel="nofollow">QRcode</a>
                </span>
            </div>
            <div class="bottom-bar-items right">
                <span class="bottom-bar-item"><?php theNext($this); ?></span>
                <span class="bottom-bar-item"><?php thePrev($this); ?></span>
                <span class="bottom-bar-item"><a href="#footer">↓</a></span>
                <span class="bottom-bar-item"><a href="#">↑</a></span>
            </div>
        </div>
    </div>
    <div id="respond-post-${post.postId!}" class="comment-container">
        <div id="comments" class="clearfix">
            <#include "comment.ftl">
        </div>
    </div>
<#include "footer.ftl">
