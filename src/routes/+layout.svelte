<script lang="ts">
	import './layout.css';
	import profileImg from '$lib/images/profile.jpeg';

	const profile = {
		name: 'Dimitri Lazarevic',
		role: 'Développeur Full-Stack',
		availability: 'Actuellement employé',
		email: 'lazarevic.dimitri@gmail.com',
		socials: [
			{
				label: 'LinkedIn',
				href: 'https://www.linkedin.com/in/dimitri-lazarevic-595ba8197/',
				icon: `<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="currentColor"><path d="M19 0h-14c-2.761 0-5 2.239-5 5v14c0 2.761 2.239 5 5 5h14c2.762 0 5-2.239 5-5v-14c0-2.761-2.238-5-5-5zm-11 19h-3v-11h3v11zm-1.5-12.268c-.966 0-1.75-.79-1.75-1.764s.784-1.764 1.75-1.764 1.75.79 1.75 1.764-.783 1.764-1.75 1.764zm13.5 12.268h-3v-5.604c0-3.368-4-3.113-4 0v5.604h-3v-11h3v1.765c1.396-2.586 7-2.777 7 2.476v6.759z"/></svg>`
			},
			{
				label: 'GitHub',
				href: 'https://github.com/dimitrilazarevic',
				icon: `<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="currentColor"><path d="M12 0c-6.626 0-12 5.373-12 12 0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23.957-.266 1.983-.399 3.003-.404 1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576 4.765-1.589 8.199-6.086 8.199-11.386 0-6.627-5.373-12-12-12z"/></svg>`
			}
		]
	};

	let { children } = $props();
</script>

<div class="app-shell">
	<aside class="sidebar">
		<div class="contact-card">
			<img src={profileImg} alt={profile.name} class="avatar" />

			<div class="identity">
				<h1 class="name">{profile.name}</h1>
				<p class="role">{profile.role}</p>
			</div>

			<div class="availability">
				<span class="dot"></span>
				{profile.availability}
			</div>

			<div class="divider"></div>

			<div class="contact-section">
				<p class="section-label">Contact</p>
				<a href="mailto:{profile.email}" class="contact-item">
					<svg
						xmlns="http://www.w3.org/2000/svg"
						width="16"
						height="16"
						viewBox="0 0 24 24"
						fill="none"
						stroke="currentColor"
						stroke-width="2"
						stroke-linecap="round"
						stroke-linejoin="round"
					>
						<rect width="20" height="16" x="2" y="4" rx="2" />
						<path d="m22 7-8.97 5.7a1.94 1.94 0 0 1-2.06 0L2 7" />
					</svg>
					<span>{profile.email}</span>
				</a>
			</div>

			<div class="divider"></div>

			<div class="social-section">
				<p class="section-label">Réseaux</p>
				<div class="social-links">
					{#each profile.socials as social (social.label)}
						<a href={social.href} class="social-btn" target="_blank" rel="noopener noreferrer">
							{@html social.icon}
							<span>{social.label}</span>
						</a>
					{/each}
				</div>
			</div>
		</div>
	</aside>

	<main class="content">
		{@render children()}
	</main>
</div>

<style>
	.app-shell {
		display: flex;
		min-height: 100vh;
		max-width: 1200px;
		margin: 0 auto;
	}

	/* ── Sidebar ── */
	.sidebar {
		width: 340px;
		flex-shrink: 0;
		position: sticky;
		top: 2.5rem;
		align-self: flex-start;
		padding: 2.5rem 1rem 2.5rem 2rem;
		display: flex;
		justify-content: center;
	}

	.contact-card {
		display: flex;
		flex-direction: column;
		align-items: center;
		gap: 1.25rem;
		color: var(--text-on-dark);
		background: var(--sidebar-bg);
		border-radius: 20px;
		padding: 2rem 1.75rem;
		width: 100%;
		text-align: center;
	}

	.avatar {
		width: 100%;
		aspect-ratio: 1;
		border-radius: 14px;
		object-fit: cover;
		object-position: center top;
		display: block;
	}

	.name {
		font-size: 1.25rem;
		color: #f8fafc;
	}

	.role {
		font-size: 0.85rem;
		color: var(--text-muted-dark);
		margin-top: 0.2rem;
	}

	.availability {
		display: inline-flex;
		align-items: center;
		gap: 0.5rem;
		font-size: 0.78rem;
		color: #4ade80;
		background: rgba(74, 222, 128, 0.1);
		border: 1px solid rgba(74, 222, 128, 0.2);
		border-radius: 999px;
		padding: 0.3rem 0.75rem;
		width: fit-content;
	}

	.dot {
		width: 7px;
		height: 7px;
		border-radius: 50%;
		background: #4ade80;
		animation: pulse 2s infinite;
	}

	@keyframes pulse {
		0%,
		100% {
			opacity: 1;
		}
		50% {
			opacity: 0.4;
		}
	}

	.divider {
		height: 1px;
		width: 100%;
		background: var(--border-dark);
	}

	.contact-section,
	.social-section {
		width: 100%;
		text-align: left;
	}

	.section-label {
		font-size: 0.7rem;
		font-weight: 600;
		letter-spacing: 0.1em;
		text-transform: uppercase;
		color: var(--text-muted-dark);
		margin-bottom: 0.6rem;
	}

	.contact-item {
		display: flex;
		align-items: center;
		gap: 0.6rem;
		font-size: 0.82rem;
		color: var(--text-on-dark);
		transition: color 0.15s;
		overflow: hidden;
	}

	.contact-item span {
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	}

	.contact-item:hover {
		color: var(--sidebar-accent);
	}

	.social-links {
		display: flex;
		flex-direction: column;
		gap: 0.5rem;
	}

	.social-btn {
		display: flex;
		align-items: center;
		gap: 0.75rem;
		padding: 0.6rem 0.75rem;
		border-radius: 8px;
		font-size: 0.85rem;
		color: var(--text-on-dark);
		background: rgba(255, 255, 255, 0.05);
		border: 1px solid var(--border-dark);
		transition:
			background 0.15s,
			color 0.15s,
			border-color 0.15s;
	}

	.social-btn:hover {
		background: rgba(59, 130, 246, 0.15);
		color: #60a5fa;
		border-color: rgba(59, 130, 246, 0.3);
	}

	/* ── Main content ── */
	.content {
		flex: 1;
		min-width: 0;
		padding: 2.5rem 2.5rem 2.5rem 2.5rem;
	}

	/* ── Responsive ── */
	@media (max-width: 768px) {
		.app-shell {
			flex-direction: column;
		}

		.sidebar {
			width: 100%;
			position: static;
			padding: 1.5rem;
		}

		.content {
			padding: 0 1.5rem 1.5rem;
		}
	}
</style>
