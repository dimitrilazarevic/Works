<script lang="ts">
	const palette = {
		blue: { bg: '#eff6ff', accent: '#2563eb' },
		green: { bg: '#f0fdf4', accent: '#16a34a' },
		purple: { bg: '#faf5ff', accent: '#7c3aed' },
		amber: { bg: '#fffbeb', accent: '#d97706' },
		cyan: { bg: '#f0f9ff', accent: '#0284c7' },
		rose: { bg: '#fff1f2', accent: '#e11d48' }
	} as const;

	type Color = keyof typeof palette;

	const projects: {
		title: string;
		description: string;
		tag: string;
		href: string;
		color: Color;
	}[] = [
		{
			title: 'Publipostage',
			description: `Un outil performant qui permet d'automatiser de l'envoi de mail à partir d'un template docx et d'un excel, qui prend en charge la connexion SSO via Google et Microsoft.`,
			tag: 'Frontend · Backend',
			href: '/applications-web',
			color: 'blue'
		},
		{
			title: 'Wizardoc',
			description: `Automatiser l'analyse de documents pour tous les usages métier de votre choix, et définir des actions après analyse.`,
			tag: 'Frontend · Backend · IA',
			href: '/applications-web',
			color: 'purple'
		},
		{
			title: `L'Oréal Dataviz`,
			description: `Un outil de visualisation de données et de gestion de fichiers de simulation pour l'Oréal.`,
			tag: 'Frontend · Backend',
			href: '/applications-web',
			color: 'green'
		}
	];
</script>

<svelte:head>
	<title>Dimitri Lazarevic — Développeur Full-Stack</title>
	<meta
		name="description"
		content="Portfolio de Dimitri Lazarevic, développeur full-stack disponible pour missions."
	/>
</svelte:head>

<div class="page">
	<header class="page-header">
		<h1>Mes projets</h1>
		<p>Sélectionnez un domaine pour découvrir mes réalisations et mon approche.</p>
	</header>

	<div class="grid">
		{#each projects as project (project.title)}
			<a
				href={project.href}
				class="card"
				style="--bg: {palette[project.color].bg}; --accent: {palette[project.color].accent};"
			>
				<div class="card-top">
					<span
						class="tag"
						style="color: {palette[project.color].accent}; background: {palette[project.color]
							.accent}18;"
					>
						{project.tag}
					</span>
				</div>
				<div class="card-body">
					<h2 class="card-title">{project.title}</h2>
					<p class="card-desc">{project.description}</p>
				</div>
				<div class="card-footer">
					<span class="cta" style="color: {palette[project.color].accent};">
						<svg
							xmlns="http://www.w3.org/2000/svg"
							width="14"
							height="14"
							viewBox="0 0 24 24"
							fill="none"
							stroke="currentColor"
							stroke-width="2.5"
							stroke-linecap="round"
							stroke-linejoin="round"
						>
							<path d="M5 12h14" />
							<path d="m12 5 7 7-7 7" />
						</svg>
					</span>
				</div>
			</a>
		{/each}
	</div>
</div>

<style>
	.page {
		max-width: 860px;
	}

	.page-header {
		margin-bottom: 3rem;
		padding-top: 1rem;
	}

	.page-header h1 {
		font-size: clamp(2.5rem, 5vw, 3.75rem);
		font-weight: 700;
		color: #0f172a;
		line-height: 1.1;
		letter-spacing: -0.02em;
		margin-bottom: 0.75rem;
	}

	.page-header p {
		font-size: 1rem;
		color: var(--text-secondary);
	}

	.grid {
		display: flex;
		flex-direction: column;
		gap: 1rem;
	}

	.card {
		display: flex;
		flex-direction: row;
		align-items: center;
		gap: 1.5rem;
		padding: 3.25rem 1.5rem;
		background: var(--bg);
		border-radius: var(--radius);
		border: 1px solid transparent;
		box-shadow: var(--shadow);
		cursor: pointer;
		transition:
			transform 0.2s ease,
			box-shadow 0.2s ease,
			border-color 0.2s ease;
	}

	.card:hover {
		transform: translateY(-3px);
		box-shadow: var(--shadow-hover);
		border-color: var(--accent);
	}

	.card-top {
		flex-shrink: 0;
		width: 140px;
	}

	.tag {
		display: inline-block;
		font-size: 0.72rem;
		font-weight: 600;
		letter-spacing: 0.04em;
		padding: 0.3rem 0.7rem;
		border-radius: 999px;
		white-space: nowrap;
	}

	.card-body {
		flex: 1;
		min-width: 0;
	}

	.card-title {
		font-size: 1.05rem;
		color: #0f172a;
		margin-bottom: 0.25rem;
	}

	.card-desc {
		font-size: 0.875rem;
		color: var(--text-secondary);
		margin: 0;
	}

	.card-footer {
		flex-shrink: 0;
	}

	.cta {
		display: inline-flex;
		align-items: center;
		gap: 0.4rem;
		font-size: 0.82rem;
		font-weight: 600;
		white-space: nowrap;
		transition: gap 0.15s ease;
	}

	.card:hover .cta {
		gap: 0.65rem;
	}

	@media (max-width: 640px) {
		.card {
			flex-direction: column;
			align-items: flex-start;
		}

		.card-top {
			width: auto;
		}
	}
</style>
