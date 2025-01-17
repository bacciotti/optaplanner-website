<#import "normalBase.ftl" as parent>
<#import "macros.ftl" as macros>
<#assign pom = data.get('pom.yml')>

<@layout>${content.body}</@layout>

<#macro layout>
<@parent.layout>
    <h1>${content.title}</h1>
    <div class="paragraph summaryParagraph">
        <p><strong>OptaPlanner’s public API classes are backwards compatible</strong> (per series),
            but users often also use impl classes (which are documented in the reference manual too).
            This upgrade recipe <em>minimizes the pain</em> to upgrade your code and to take advantage of the newest features in OptaPlanner.</p>
    </div>
    <div class="row">
        <div class="col-md-7">
            <h2 class="mt-0">Legend</h2>
            <p>Every upgrade note has an indication how likely your code will be affected by that change:</p>
            <ul class="upgrade-recipe-label-list">
                <li>
                    <span class="badge bg-danger label-as-badge">Major</span>
                    Likely to affect your code.
                </li>
                <li>
                    <span class="badge bg-warning label-as-badge">Minor</span>
                    Unlikely to affect your code (especially if you followed the examples), unless you have hacks.
                </li>
                <li>
                    <span class="badge bg-info label-as-badge">Impl detail</span>
                    Will not affect your code, unless you have very deep hacks.
                </li>
                <li>
                    <span class="badge bg-primary label-as-badge">Recommended</span>
                    Not a backward incompatible change, but you probably want to do this.
                </li>
                <li>
                    <span class="badge bg-success label-as-badge">Readme</span>
                    Read this to better understand why the subsequent major changes were made.
                </li>
                <li>
                    <span class="badge bg-automated label-as-badge">Automated</span>
                    Can be applied automatically using our <a href="#automatic-upgrade">migration tooling</a>.
                </li>
            </ul>
            <div class="sect1">
                <h2>Upgrade from an older version</h2>
                <p>To upgrade from an older version, first apply <a href="./">the previous upgrade recipes</a>.
               You will find the order of migration steps bellow: </p>
            </div>
        </div>
        <div class="col-md-5 mb-4">
            <@macros.productToProjectVersionMapping/>
        </div>
    </div>
    <div class="sect1" id="automatic-upgrade">
        <h2 id="automatic-upgrade">Automatic upgrade to the latest version</h2>
        <p>
            <b>Update your code in seconds</b>, with <code>optaplanner-migration</code>
            (an <a href="https://docs.openrewrite.org/">OpenRewrite</a> recipe). Try it:
        </p>
        <ol>
            <li>Stash any local changes.</li>
            <li>
                Run this command in your project directory:
                <div class="listingblock">
                    <div class="content">
                        <pre class="highlight"><code class="language-shell" data-lang="shell">mvn clean org.openrewrite.maven:rewrite-maven-plugin:4.44.0:run -Drewrite.recipeArtifactCoordinates=org.optaplanner:optaplanner-migration:${pom.latestFinal.version} -Drewrite.activeRecipes=org.optaplanner.migration.ToLatest9</code></pre>
                    </div>
                </div>
                <p>
                    Note: The <a href="https://github.com/openrewrite/rewrite/issues/2416">-Drewrite.recipeArtifactCoordinates might not work</a>,
                    use the more verbose <code>pom.xml</code> approach instead.
                </p>
            </li>
            <li>Check the local changes and commit them.</li>
        </ol>
        <p>
            It only does upgrade steps with an <span class="badge bg-automated label-as-badge">Automated</span> badge.
        </p>
    </div>
    <#nested>
</@parent.layout>
</#macro>
