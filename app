<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>NexGen App Interface</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@300;400;500;700&display=swap"
        rel="stylesheet">
    <style>
        :root {
            --neon-green: #39FF14;
            --bg-dark: #000000;
            --panel-bg: #111111;
            --shared-height: 64px;
            --header-height: 120px;
        }

        body {
            background-color: var(--bg-dark);
            color: white;
            font-family: 'Space Grotesk', sans-serif;
            margin: 0;
            padding: 0;
            overflow: hidden;
            padding-top: env(safe-area-inset-top);
            padding-bottom: env(safe-area-inset-bottom);
        }

        .app-container {
            display: flex;
            flex-direction: column;
            height: 100vh;
            width: 100%;
            max-width: 500px;
            margin: 0 auto;
            position: relative;
            background: var(--bg-dark);
        }

        .fixed-header {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 100;
            background: transparent !important;
            pointer-events: none;
            padding-top: 24px;
            padding-bottom: 24px;
        }

        .fixed-header>div,
        .fixed-header button,
        .fixed-header .user-pill {
            pointer-events: auto;
        }

        .user-pill {
            height: var(--shared-height);
            padding-left: 8px;
            padding-right: 28px;
            background: rgba(26, 26, 26, 0.8);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 9999px;
            display: flex;
            align-items: center;
            gap: 12px;
            min-width: 160px;
            backdrop-filter: blur(12px);
        }

        .profile-pic {
            width: 48px;
            height: 48px;
            border-radius: 50%;
            object-fit: cover;
            border: 1px solid rgba(57, 255, 20, 0.3);
        }

        .icon-btn {
            width: var(--shared-height);
            height: var(--shared-height);
            border-radius: 9999px;
            background: rgba(26, 26, 26, 0.8);
            border: 1px solid rgba(255, 255, 255, 0.1);
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.2s ease;
            backdrop-filter: blur(12px);
        }

        /* Content Styling */
        .filter-chip {
            white-space: nowrap;
            padding: 8px 20px;
            border-radius: 9999px;
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            font-size: 13px;
            font-weight: 500;
            color: rgba(255, 255, 255, 0.5);
            transition: all 0.3s ease;
        }

        .filter-chip.active {
            background: var(--neon-green);
            color: black;
            border-color: var(--neon-green);
        }

        .promo-poster {
            background: linear-gradient(135deg, #1a1a1a 0%, #000 100%);
            border: 1px solid rgba(57, 255, 20, 0.2);
            border-radius: 32px;
            position: relative;
            overflow: hidden;
        }

        .scan-line {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 2px;
            background: linear-gradient(90deg, transparent, var(--neon-green), transparent);
            animation: scan 3s linear infinite;
            opacity: 0.3;
        }

        @keyframes scan {
            0% {
                top: 0%;
            }

            100% {
                top: 100%;
            }
        }

        .glass-panel {
            background: rgba(20, 20, 20, 0.6);
            border: 1px solid rgba(255, 255, 255, 0.05);
            border-radius: 24px;
            backdrop-filter: blur(10px);
        }

        /* Shortcut Cards */
        .shortcut-card {
            min-width: 140px;
            background: rgba(255, 255, 255, 0.03);
            border: 1px solid rgba(255, 255, 255, 0.08);
            border-radius: 20px;
            padding: 16px;
            display: flex;
            flex-direction: column;
            gap: 12px;
            transition: all 0.2s ease;
            cursor: pointer;
        }

        .shortcut-card:active {
            transform: scale(0.95);
            background: rgba(255, 255, 255, 0.06);
        }

        .bottom-nav-dock {
            position: fixed;
            bottom: 24px;
            left: 50%;
            transform: translateX(-50%);
            width: calc(100% - 48px);
            max-width: 400px;
            height: var(--shared-height);
            background: rgba(22, 22, 22, 0.9);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 9999px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 6px;
            z-index: 1000;
            backdrop-filter: blur(12px);
        }

        .nav-item {
            position: relative;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            width: 52px;
            height: 52px;
            border-radius: 9999px;
            transition: all 0.25s cubic-bezier(0.4, 0, 0.2, 1);
            color: rgba(255, 255, 255, 0.3);
            cursor: pointer;
        }

        .nav-label {
            font-size: 10px;
            margin-top: 2px;
            opacity: 0.7;
        }

        .nav-item.active {
            color: var(--neon-green);
            background: rgba(57, 255, 20, 0.1);
        }

        .center-action {
            width: 52px;
            height: 52px;
            background: transparent;
            border-radius: 9999px;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.2s ease;
            flex-shrink: 0;
            cursor: pointer;
            color: var(--neon-green);
        }

        /* View-specific Top Spacing */
        .view-content {
            display: none;
            animation: fadeIn 0.3s ease;
            padding-top: 2rem;
        }

        .view-content.active {
            display: block;
        }

        main {
            flex: 1;
            padding: 1.5rem;
            padding-top: calc(120px + 1.5rem);
            overflow-y: auto;
            -webkit-overflow-scrolling: touch;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }

            to {
                opacity: 1;
            }

            from {
                opacity: 0;
                transform: translateY(10px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .no-scrollbar::-webkit-scrollbar {
            display: none;
        }

        .no-scrollbar {
            -ms-overflow-style: none;
            scrollbar-width: none;
        }

        /* AI Chat Specific */
        #chat-messages {
            height: calc(100vh - 460px);
            overflow-y: auto;
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .message {
            max-width: 85%;
            padding: 12px 16px;
            border-radius: 20px;
            font-size: 14px;
            line-height: 1.5;
        }

        .message-ai {
            align-self: flex-start;
            background: rgba(255, 255, 255, 0.05);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-bottom-left-radius: 4px;
        }

        .message-user {
            align-self: flex-end;
            background: var(--neon-green);
            color: black;
            border-bottom-right-radius: 4px;
        }

        .typing-indicator {
            display: none;
            font-size: 10px;
            color: var(--neon-green);
            margin-bottom: 8px;
        }

        /* Search Styles */
        #search-container {
            transition: all 0.5s cubic-bezier(0.34, 1.56, 0.64, 1);
            overflow: hidden;
            width: var(--shared-height);
        }

        #search-container.active {
            width: 240px;
            background: rgba(0, 0, 0, 0.85);
            border-color: var(--neon-green);
            box-shadow: 0 0 20px rgba(57, 255, 20, 0.2);
        }

        #search-container.active #search-icon-path {
            opacity: 0;
        }

        #search-container.active #close-icon-path {
            opacity: 1;
            transform: rotate(0deg);
        }

        #close-icon-path {
            opacity: 0;
            transform: rotate(-90deg);
            transform-origin: center;
            transition: all 0.4s ease;
        }

        #search-input {
            transition: all 0.3s ease;
            transform: translateX(10px);
            opacity: 0;
        }

        #search-container.active #search-input {
            transform: translateX(0);
            opacity: 1;
        }

        .search-glitch-border {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            border-radius: 9999px;
            pointer-events: none;
            opacity: 0;
            border: 1px solid transparent;
        }

        #search-container.active .search-glitch-border {
            animation: pulse-border 2s infinite;
            border-color: rgba(57, 255, 20, 0.3);
            opacity: 1;
        }

        @keyframes pulse-border {
            0% {
                box-shadow: 0 0 0 0 rgba(57, 255, 20, 0.4);
            }

            70% {
                box-shadow: 0 0 0 10px rgba(57, 255, 20, 0);
            }

            100% {
                box-shadow: 0 0 0 0 rgba(57, 255, 20, 0);
            }
        }

        /* 
         * =========================================
         * PROJECT VIDEO & CARD STYLES
         * =========================================
         */
        #view-projects {
            scroll-snap-type: y mandatory;
            -webkit-overflow-scrolling: touch;
        }

        .project-card {
            scroll-snap-align: start;
            scroll-snap-stop: always;
            min-height: 100vh;
            height: 100vh;
        }

        .video-container {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            cursor: pointer;
        }

        .video-container video {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .play-button {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 80px;
            height: 80px;
            background: rgba(0, 0, 0, 0.4);
            backdrop-filter: blur(4px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 10;
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            /* Updated default state for default play */
            pointer-events: none;
        }

        .play-button svg {
            width: 32px;
            height: 32px;
            fill: white;
            margin-left: 4px;
        }

        /* Action Buttons */
        .action-buttons {
            position: fixed;
            right: 16px;
            bottom: 100px;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 16px;
            z-index: 50;
        }

        .action-button {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: all 0.2s ease;
            position: relative;
            padding: 4px 0;
            min-width: 44px;
        }

        .action-button:hover {
            transform: scale(1.1);
        }

        .action-button:active {
            transform: scale(0.95);
        }

        .action-button svg {
            width: 24px;
            height: 24px;
            color: white;
            transition: all 0.2s ease;
        }

        .action-button:hover svg {
            color: white;
        }

        .action-button.like.active svg {
            fill: #ff3b30;
            color: #ff3b30;
        }

        .action-buttons> :last-child:not(.profile-button) {
            margin-bottom: 20px;
        }

        .profile-button {
            width: 40px !important;
            height: 40px !important;
            padding: 2px;
            margin-top: 20px;
            background: rgba(0, 0, 0, 0.3) !important;
            border: 1px solid rgba(255, 255, 255, 0.1) !important;
            border-radius: 50% !important;
            transition: all 0.2s ease;
            overflow: hidden;
        }

        .profile-button:hover {
            transform: scale(1.1);
            background: rgba(255, 255, 255, 0.1) !important;
        }

        .profile-button img {
            width: 100%;
            height: 100%;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid #1a1a1a;
        }

        .action-button .action-count {
            font-size: 11px;
            font-weight: 500;
            color: white;
            margin-top: 2px;
            text-shadow: 0 1px 2px rgba(0, 0, 0, 0.5);
        }
    </style>
</head>

<body>
    <div class="app-container">
        <!-- Floating Header -->
        <header class="fixed-header px-6 flex justify-between items-center">
            <div class="user-pill cursor-pointer" onclick="showView('profile')">
                <img src="assets/images/placeholder.webp" alt="Klerry" class="profile-pic"
                    onerror="this.src='assets/images/placeholder.webp'">
                <div class="text-sm">
                    <p class="font-medium">Klerry</p>
                    <p class="text-xs opacity-60">@klerry</p>
                </div>
            </div>

            <div class="flex gap-4 items-center">
                <div class="relative">
                    <!-- AWESOME SEARCH IMPLEMENTATION -->
                    <div id="search-container"
                        class="relative flex items-center justify-end h-[64px] rounded-full bg-[#1a1a1a]/80 border border-white/10 backdrop-blur-xl">

                        <!-- Animated Glow Border -->
                        <div class="search-glitch-border"></div>

                        <!-- Input Field -->
                        <input type="text" id="search-input"
                            class="absolute left-4 right-12 top-0 bottom-0 bg-transparent text-white text-sm placeholder-white/30 focus:outline-none font-mono tracking-wide"
                            placeholder="Search anything">

                        <!-- Trigger Button -->
                        <button id="search-toggle"
                            class="absolute right-0 w-[64px] h-[64px] flex items-center justify-center z-20 text-white/80">
                            <svg class="w-6 h-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <!-- Magnifying Glass -->
                                <path id="search-icon-path" stroke-linecap="round" stroke-linejoin="round"
                                    stroke-width="2" d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"
                                    style="transition: opacity 0.3s ease" />
                                <!-- X Icon (Close) -->
                                <path id="close-icon-path" stroke-linecap="round" stroke-linejoin="round"
                                    stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                            </svg>
                        </button>
                    </div>
                </div>

                <button class="icon-btn relative" onclick="showView('cart')">
                    <svg class="w-6 h-6 text-white/80" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                            d="M3 3h2l.4 2M7 13h10l4-8H5.4M7 13L5.4 5M7 13l-2.293 2.293c-.63.63-.184 1.707.707 1.707H17m0 0a2 2 0 100 4 2 2 0 000-4zm-8 0a2 2 0 100 4 2 2 0 000-4z" />
                    </svg>
                    <span id="cart-count"
                        class="absolute -top-1 -right-1 bg-red-500 text-white text-xs rounded-full w-5 h-5 flex items-center justify-center hidden">0</span>
                </button>
            </div>
        </header>

        <!-- Main Content -->
        <main class="flex-grow px-6 overflow-y-auto no-scrollbar pb-40">

            <!-- HOME VIEW -->
            <div id="view-home" class="view-content active space-y-8">
                <div class="space-y-1">
                    <h1 class="text-4xl font-bold tracking-tight">Smart life,</h1>
                    <h2 class="text-2xl font-light text-white/50 italic">in a klerry creative hub</h2>
                </div>

                <div class="flex overflow-x-auto gap-3 no-scrollbar -mx-6 px-6">
                    <button class="filter-chip active">All</button>
                    <button class="filter-chip">Development</button>
                    <button class="filter-chip">Design</button>
                    <button class="filter-chip">Architecture</button>
                </div>

                <div class="promo-poster p-8">
                    <div class="scan-line"></div>
                    <div class="relative z-10 space-y-4">
                        <div
                            class="inline-block px-3 py-1 rounded-full bg-white/10 border border-white/10 text-[10px] font-bold uppercase tracking-wider">
                            New Prototype</div>
                        <h3 class="text-2xl font-bold leading-tight">Augmented Reality<br>Interface v2.4</h3>
                        <button onclick="showView('projects')"
                            class="bg-white text-black px-6 py-3 rounded-full text-xs font-bold hover:scale-105 transition-transform">Get
                            Started</button>
                    </div>
                </div>

                <!-- SHORTCUT CARDS -->
                <div class="flex overflow-x-auto gap-4 no-scrollbar -mx-6 px-6 pb-2">
                    <div class="shortcut-card" onclick="showView('contact')">
                        <div
                            class="w-10 h-10 rounded-full bg-green-500/10 flex items-center justify-center text-green-400">
                            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"
                                    stroke-width="2" />
                            </svg>
                        </div>
                        <div class="space-y-0.5">
                            <p class="text-[10px] uppercase tracking-wider text-white/30 font-bold">About</p>
                            <p class="text-sm font-bold">Klerry</p>
                        </div>
                    </div>

                    <div class="shortcut-card" onclick="showView('projects')">
                        <div
                            class="w-10 h-10 rounded-full bg-blue-500/10 flex items-center justify-center text-blue-400">
                            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path
                                    d="M15 10l4.553-2.276A1 1 0 0121 8.618v6.764a1 1 0 01-1.447.894L15 14M5 18h8a2 2 0 002-2V8a2 2 0 00-2-2H5a2 2 0 00-2 2v8a2 2 0 002 2z"
                                    stroke-width="2" />
                            </svg>
                        </div>
                        <div class="space-y-0.5">
                            <p class="text-[10px] uppercase tracking-wider text-white/30 font-bold">Trailer</p>
                            <p class="text-sm font-bold">Hub Page</p>
                        </div>
                    </div>

                    <div class="shortcut-card" onclick="showView('shop')">
                        <div
                            class="w-10 h-10 rounded-full bg-orange-500/10 flex items-center justify-center text-orange-400">
                            <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path d="M16 11V7a4 4 0 00-8 0v4M5 9h14l1 12H4L5 9z" stroke-width="2" />
                            </svg>
                        </div>
                        <div class="space-y-0.5">
                            <p class="text-[10px] uppercase tracking-wider text-white/30 font-bold">Trailer</p>
                            <p class="text-sm font-bold">Marketplace</p>
                        </div>
                    </div>
                </div>

                <!-- Team Members Card -->
                <div class="glass-panel rounded-2xl overflow-hidden">
                    <div class="aspect-[3/4] relative">
                        <!-- Background Pattern -->
                        <div class="absolute inset-0 bg-gradient-to-br from-blue-500/5 to-purple-500/5">
                            <div class="absolute inset-0 opacity-10"
                                style="background-image: url(&quot;data:image/svg+xml,%3Csvg width='40' height='40' viewBox='0 0 40 40' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='%23ffffff' fill-opacity='0.1' fill-rule='evenodd'%3E%3Cpath d='M0 40L40 0H20L0 20M40 40V20L20 40'/%3E%3C/g%3E%3C/svg%3E&quot;);">
                            </div>
                        </div>

                        <!-- Team Members Grid -->
                        <div class="relative z-10 p-6 h-full flex flex-col">
                            <div class="mb-4">
                                <h3 class="text-xl font-bold">Team Klerry</h3>
                                <p class="text-sm text-white/60">Meet the creative minds</p>
                            </div>

                            <div class="grid grid-cols-3 gap-4 flex-grow">
                                <!-- Row 1 -->
                                <!-- Current User (Klerry) -->
                                <div class="flex flex-col items-center text-center relative">
                                    <div class="relative">
                                        <div class="w-14 h-14 rounded-full bg-cover bg-center mb-2 border-2 border-[#39FF14]"
                                            style="background-image: url('assets/images/placeholder.webp');"></div>
                                        <div
                                            class="absolute -top-1 -right-1 w-3 h-3 bg-[#39FF14] rounded-full flex items-center justify-center">
                                            <svg class="w-2.5 h-2.5 text-black" fill="currentColor" viewBox="0 0 20 20">
                                                <path fill-rule="evenodd"
                                                    d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z"
                                                    clip-rule="evenodd" />
                                            </svg>
                                        </div>
                                    </div>
                                    <span class="font-medium text-xs">Klerry</span>
                                    <span class="text-[10px] text-[#39FF14]">You</span>
                                </div>

                                <!-- Reinmax -->
                                <div class="flex flex-col items-center text-center">
                                    <div class="w-14 h-14 rounded-full bg-cover bg-center mb-2 border-2 border-green-400"
                                        style="background-image: url('assets/images/placeholder.webp');"></div>
                                    <span class="font-medium text-xs">Reinmax</span>
                                    <span class="text-[10px] text-white/60">Tech Lead</span>
                                </div>

                                <!-- Henry -->
                                <div class="flex flex-col items-center text-center">
                                    <div class="w-14 h-14 rounded-full bg-cover bg-center mb-2 border-2 border-blue-400"
                                        style="background-image: url('assets/images/placeholder.webp');"></div>
                                    <span class="font-medium text-xs">Henry</span>
                                    <span class="text-[10px] text-white/60">Designer</span>
                                </div>

                                <!-- Row 2 -->
                                <!-- Jaspina -->
                                <div class="flex flex-col items-center text-center">
                                    <div class="w-14 h-14 rounded-full bg-cover bg-center mb-2 border-2 border-purple-400"
                                        style="background-image: url('assets/images/placeholder.webp');"></div>
                                    <span class="font-medium text-xs">Jaspina</span>
                                    <span class="text-[10px] text-white/60">Developer</span>
                                </div>

                                <!-- Samson -->
                                <div class="flex flex-col items-center text-center">
                                    <div class="w-14 h-14 rounded-full bg-cover bg-center mb-2 border-2 border-yellow-400"
                                        style="background-image: url('assets/images/placeholder.webp');"></div>
                                    <span class="font-medium text-xs">Samson</span>
                                    <span class="text-[10px] text-white/60">Developer</span>
                                </div>

                                <!-- Betty -->
                                <div class="flex flex-col items-center text-center">
                                    <div class="w-14 h-14 rounded-full bg-cover bg-center mb-2 border-2 border-pink-400"
                                        style="background-image: url('assets/images/placeholder.webp');"></div>
                                    <span class="font-medium text-xs">Betty</span>
                                    <span class="text-[10px] text-white/60">Product</span>
                                </div>
                            </div>

                            <button onclick="showView('projects')"
                                class="mt-4 w-full py-2.5 bg-[#39FF14] hover:bg-[#2ee00c] text-black rounded-full text-sm font-medium transition-colors flex items-center justify-center gap-2">
                                <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                        d="M12 4v16m8-8H4" />
                                </svg>
                                Collaborate
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- PROJECTS VIEW -->
            <div id="view-projects" class="view-content fixed inset-0 overflow-y-auto snap-y snap-mandatory">
                <!-- Projects Container -->
                <div class="h-full snap-y snap-mandatory overflow-y-auto">
                    <!-- Projects Grid -->
                    <div class="grid grid-cols-1 gap-0 h-full">
                        <!-- Project cards will be dynamically inserted here by JavaScript -->
                    </div>
                </div>
                <!-- Quick Actions (Removed Invite Team) -->
            </div>

            <!-- ADD VIEW (CREATOR STUDIO) -->
            <div id="view-content" class="view-content space-y-6">
                <h2 class="text-2xl font-bold text-center">Creator Studio</h2>

                <!-- New Project Card -->
                <div class="glass-panel p-6 text-left hover:bg-white/5 transition-colors rounded-2xl cursor-pointer">
                    <div class="flex items-start gap-4">
                        <div
                            class="w-12 h-12 rounded-xl bg-green-500/10 flex items-center justify-center text-green-400 flex-shrink-0">
                            <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M12 4v16m8-8H4" />
                            </svg>
                        </div>
                        <div>
                            <h3 class="font-bold text-lg">New Project</h3>
                            <p class="text-sm text-white/60 mt-1">Start a new project from scratch</p>
                            <button
                                class="mt-3 px-4 py-2 bg-green-500/10 text-green-400 text-sm font-medium rounded-full hover:bg-green-500/20 transition-colors">
                                Create Project
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Other Creator Tools -->
                <div
                    class="aspect-square glass-panel flex flex-col items-center justify-center border-dashed border-white/20 p-10 mt-6">
                    <div
                        class="w-16 h-16 rounded-full bg-blue-500/10 flex items-center justify-center mb-4 text-blue-400">
                        <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4" />
                        </svg>
                    </div>
                    <h3 class="font-bold">Start New Build</h3>
                    <p class="text-xs text-white/30 mt-2">Initialize a fresh creative node</p>
                </div>
            </div>

            <!-- SHOP VIEW -->
            <div id="view-shop" class="view-content space-y-8">
                <div class="space-y-1">
                    <h2 class="text-3xl font-bold">Marketplace</h2>
                    <p class="text-white/40 text-sm">Premium assets for your projects</p>
                </div>

                <!-- Categories -->
                <div class="flex overflow-x-auto gap-3 no-scrollbar -mx-6 px-6 pb-2" id="category-filters">
                    <button
                        class="px-5 py-2.5 rounded-full bg-[#39FF14] text-black text-sm font-medium whitespace-nowrap filter-btn active"
                        data-category="all">
                        All
                    </button>
                    <button
                        class="px-5 py-2.5 rounded-full glass-panel text-white/80 hover:text-white text-sm font-medium whitespace-nowrap transition-all duration-200 filter-btn"
                        data-category="ui-kits">
                        UI Kits
                    </button>
                    <button
                        class="px-5 py-2.5 rounded-full glass-panel text-white/80 hover:text-white text-sm font-medium whitespace-nowrap transition-all duration-200 filter-btn"
                        data-category="icons">
                        Icons
                    </button>
                    <button
                        class="px-5 py-2.5 rounded-full glass-panel text-white/80 hover:text-white text-sm font-medium whitespace-nowrap transition-all duration-200 filter-btn"
                        data-category="templates">
                        Templates
                    </button>
                    <button
                        class="px-5 py-2.5 rounded-full glass-panel text-white/80 hover:text-white text-sm font-medium whitespace-nowrap transition-all duration-200 filter-btn"
                        data-category="fonts">
                        Fonts
                    </button>
                    <button
                        class="px-5 py-2.5 rounded-full glass-panel text-white/80 hover:text-white text-sm font-medium whitespace-nowrap transition-all duration-200 filter-btn"
                        data-category="illustrations">
                        Illustrations
                    </button>
                </div>

                <!-- Asset List -->
                <div class="flex flex-col gap-4" id="asset-list">
                    <!-- Assets will be dynamically inserted here -->
                </div>
            </div>

            <!-- MEDIA HUB VIEW -->
            <div id="view-media" class="view-content space-y-6">
                <div class="space-y-1">
                    <h2 class="text-3xl font-bold">Media Hub</h2>
                    <p class="text-white/40 text-sm">Your creative media collection</p>
                </div>

                <!-- Media Tabs -->
                <div class="flex space-x-2 overflow-x-auto pb-2 -mx-6 px-6 no-scrollbar">
                    <button class="media-tab active px-4 py-2 rounded-full text-sm font-medium whitespace-nowrap"
                        data-tab="all">
                        All Media
                    </button>
                    <button class="media-tab px-4 py-2 rounded-full text-sm font-medium whitespace-nowrap"
                        data-tab="videos">
                        Videos
                    </button>
                    <button class="media-tab px-4 py-2 rounded-full text-sm font-medium whitespace-nowrap"
                        data-tab="audio">
                        Audio
                    </button>
                    <button class="media-tab px-4 py-2 rounded-full text-sm font-medium whitespace-nowrap"
                        data-tab="images">
                        Images
                    </button>
                </div>

                <!-- Media Grid -->
                <div class="grid grid-cols-2 gap-4" id="media-grid">
                    <!-- Media items will be dynamically inserted here -->
                </div>

                <!-- Media Player Modal -->
                <div id="media-player" class="fixed inset-0 bg-black/90 z-50 hidden items-center justify-center p-4">
                    <div class="relative w-full max-w-2xl">
                        <button id="close-player" class="absolute -top-10 right-0 text-white/70 hover:text-white">
                            <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M6 18L18 6M6 6l12 12"></path>
                            </svg>
                        </button>
                        <div class="aspect-[1080/1350] w-full bg-black/50 rounded-xl overflow-hidden">
                            <video id="video-player" class="w-full h-full object-cover hidden" controls>
                                Your browser does not support the video tag.
                            </video>
                            <audio id="audio-player" class="w-full hidden" controls>
                                Your browser does not support the audio element.
                            </audio>
                            <img id="image-viewer" class="w-full h-full object-contain hidden"
                                src="assets/images/placeholder.webp" alt="">
                        </div>
                        <div class="mt-4 text-white text-center">
                            <h3 id="media-title" class="text-xl font-bold"></h3>
                            <p id="media-description" class="text-white/60 text-sm"></p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- AI CHAT VIEW (REAMPED) -->
            <div id="view-contact" class="view-content space-y-6">
                <div class="space-y-1">
                    <h2 class="text-3xl font-bold">AI Comms</h2>
                    <p class="text-white/40 text-sm">Connected to Klerry Creative Node</p>
                </div>

                <div id="chat-messages" class="no-scrollbar">
                    <div class="message message-ai">
                        Hello Klerry! I'm your Creative Hub assistant. How can I help you with your projects today?
                    </div>
                </div>

                <div class="typing-indicator" id="typing-indicator">Thinking...</div>

                <div class="glass-panel p-2 flex gap-2 items-center">
                    <input type="text" id="chat-input" placeholder="Ask anything..."
                        class="flex-grow bg-transparent border-none outline-none px-4 py-2 text-sm text-white placeholder:text-white/20">
                    <button id="send-btn"
                        class="w-10 h-10 rounded-full bg-white text-black flex items-center justify-center shrink-0">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="M14 5l7 7m0 0l-7 7m7-7H3" />
                        </svg>
                    </button>
                </div>
            </div>

        </main>

        <!-- CART VIEW -->
        <div id="view-cart" class="fixed inset-0 bg-[#0a0a0a] flex flex-col z-50">

            <!-- Cart Content -->
            <div class="flex-1 overflow-y-auto">
                <!-- Empty State -->
                <div id="empty-cart"
                    class="min-h-[calc(100vh-100px)] flex flex-col items-center justify-center p-8 text-center">
                    <div
                        class="w-24 h-24 bg-gradient-to-br from-[#39FF14]/10 to-emerald-500/10 rounded-2xl flex items-center justify-center mb-6">
                        <svg width="40" height="40" viewBox="0 0 24 24" fill="none" stroke="currentColor"
                            stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" class="text-[#39FF14]">
                            <circle cx="9" cy="21" r="1"></circle>
                            <circle cx="20" cy="21" r="1"></circle>
                            <path d="M1 1h4l2.68 13.39a2 2 0 002 1.61h9.72a2 2 0 002-1.61L23 6H6"></path>
                        </svg>
                    </div>
                    <h3 class="text-xl font-bold mb-2">Your cart is empty</h3>
                    <p class="text-white/60 mb-6 max-w-xs mx-auto">Looks like you haven't added anything to your cart
                        yet</p>
                    <button onclick="showView('shop')"
                        class="px-6 py-2.5 bg-[#39FF14] hover:bg-[#2ee00c] text-black rounded-full font-medium transition-all transform hover:scale-105 active:scale-95">
                        Browse Products
                    </button>
                </div>

                <!-- Cart Items -->
                <div id="cart-items" class="p-5 pb-40 space-y-4 hidden">
                    <!-- Items will be dynamically inserted here -->
                </div>
            </div>

            <!-- Cart Summary -->
            <div id="cart-summary"
                class="sticky bottom-0 bg-[#0a0a0a]/95 backdrop-blur-lg border-t border-white/10 p-5 pb-[calc(env(safe-area-inset-bottom,0px)+1.25rem)] hidden">
                <div class="flex justify-between items-center mb-4 pb-4 border-b border-white/5">
                    <span class="text-white/70">Subtotal</span>
                    <div class="text-right">
                        <span id="cart-subtotal" class="text-xl font-bold text-white">$0.00</span>
                        <p class="text-xs text-white/40">+ shipping & taxes calculated at checkout</p>
                    </div>
                </div>
                <button id="checkout-btn"
                    class="w-full bg-gradient-to-r from-[#39FF14] to-emerald-400 text-black py-3.5 rounded-xl font-semibold text-sm disabled:opacity-50 disabled:cursor-not-allowed transition-all transform hover:scale-[1.02] active:scale-[0.98]"
                    disabled>
                    Proceed to Checkout
                </button>
                <p class="text-center text-xs text-white/40 mt-3">
                    Secure checkout with SSL encryption
                </p>
            </div>
        </div>

        <!-- PROFILE VIEW -->
        <div id="view-profile" class="view-content bg-[#0a0a0a] min-h-screen">
            <!-- Profile Header -->
            <div class="relative">
                <!-- Cover Photo -->
                <div class="h-40 bg-gradient-to-r from-purple-600 to-blue-500"></div>

                <!-- Profile Info -->
                <div class="px-6 pb-6 -mt-16 relative">
                    <div class="flex justify-between items-end">
                        <div class="relative">
                            <img src="assets/images/placeholder.webp" alt="Klerry"
                                class="w-32 h-32 rounded-full border-4 border-[#0a0a0a] bg-[#0a0a0a]"
                                onerror="this.src='assets/images/placeholder.webp'">
                        </div>
                        <button
                            class="px-4 py-2 rounded-full bg-white/10 backdrop-blur-sm text-white text-sm font-medium">
                            Edit Profile
                        </button>
                    </div>

                    <div class="mt-4">
                        <h1 class="text-2xl font-bold">Klerry</h1>
                        <p class="text-white/60">@klerry</p>
                        <p class="mt-2 text-sm">Building the future of AI and creative tools. Passionate about design,
                            code, and innovation.</p>

                        <div class="flex items-center gap-4 mt-3 text-sm">
                            <div class="flex items-center gap-1 text-white/60">
                                <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path
                                        d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"
                                        stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" />
                                    <path d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" stroke-width="1.5" stroke-linecap="round"
                                        stroke-linejoin="round" />
                                </svg>
                                <span>San Francisco, CA</span>
                            </div>
                            <div class="flex items-center gap-1 text-white/60">
                                <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path
                                        d="M13.828 10.172a4 4 0 00-5.656 0l-4 4a4 4 0 105.656 5.656l1.102-1.101m-.758-4.899a4 4 0 005.656 0l4-4a4 4 0 00-5.656-5.656l-1.1 1.1"
                                        stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" />
                                </svg>
                                <a href="#" class="text-blue-400 hover:underline">klerry.design</a>
                            </div>
                        </div>

                        <div class="flex gap-4 mt-4 text-sm">
                            <div>
                                <span class="font-bold">1.2k</span>
                                <span class="text-white/60 ml-1">Following</span>
                            </div>
                            <div>
                                <span class="font-bold">5.7k</span>
                                <span class="text-white/60 ml-1">Followers</span>
                            </div>
                            <div>
                                <span class="font-bold">42</span>
                                <span class="text-white/60 ml-1">Projects</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Tabs -->
            <div class="border-t border-white/10 mt-4">
                <div class="flex">
                    <button class="flex-1 py-4 text-center text-sm font-medium border-b-2 border-white text-white">
                        Projects
                    </button>
                    <button
                        class="flex-1 py-4 text-center text-sm font-medium text-white/60 hover:text-white transition-colors">
                        Activity
                    </button>
                    <button
                        class="flex-1 py-4 text-center text-sm font-medium text-white/60 hover:text-white transition-colors">
                        Liked
                    </button>
                </div>
            </div>

            <!-- Projects Grid -->
            <div class="grid grid-cols-2 gap-4 p-4">
                <!-- Project items would go here -->
                <div class="aspect-square bg-white/5 rounded-lg flex items-center justify-center text-white/30">
                    <svg class="w-12 h-12" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path d="M12 4v16m8-8H4" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" />
                    </svg>
                </div>
                <div class="aspect-square bg-white/5 rounded-lg"></div>
                <div class="aspect-square bg-white/5 rounded-lg"></div>
                <div class="aspect-square bg-white/5 rounded-lg"></div>
            </div>

            <!-- Back Button -->
            <div class="fixed bottom-6 left-6">
                <button onclick="showView('home')"
                    class="w-12 h-12 rounded-full bg-white/10 backdrop-blur-md flex items-center justify-center text-white">
                    <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path d="M15 19l-7-7 7-7" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                    </svg>
                </button>
            </div>
        </div>

        <!-- Capsule Bottom Dock -->
        <div class="bottom-nav-dock">
            <div id="nav-home" class="nav-item active" onclick="showView('home')">
                <svg class="w-7 h-7" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path opacity="0.5"
                        d="M2.36407 12.9579C1.98463 10.3208 1.79491 9.00229 2.33537 7.87495C2.87583 6.7476 4.02619 6.06234 6.32691 4.69181L7.71175 3.86687C9.80104 2.62229 10.8457 2 12 2C13.1543 2 14.199 2.62229 16.2882 3.86687L17.6731 4.69181C19.9738 6.06234 21.1242 6.7476 21.6646 7.87495C22.2051 9.00229 22.0154 10.3208 21.6359 12.9579L21.3572 14.8952C20.8697 18.2827 20.626 19.9764 19.451 20.9882C18.2759 22 16.5526 22 13.1061 22H10.8939C7.44737 22 5.72409 22 4.54903 20.9882C3.37396 19.9764 3.13025 18.2827 2.64284 14.8952L2.36407 12.9579Z"
                        stroke="currentColor" stroke-width="1.5"></path>
                    <path d="M9 16C9.85038 16.6303 10.8846 17 12 17C13.1154 17 14.1496 16.6303 15 16"
                        stroke="currentColor" stroke-width="1.5" stroke-linecap="round"></path>
                </svg>
            </div>

            <div id="nav-projects" class="nav-item" onclick="showView('projects')">
                <svg class="w-7 h-7" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path
                        d="M2 12C2 7.28595 2 4.92893 3.46447 3.46447C4.92893 2 7.28595 2 12 2C16.714 2 19.0711 2 20.5355 3.46447C22 4.92893 22 7.28595 22 12C22 16.714 22 19.0711 20.5355 20.5355C19.0711 22 16.714 22 12 22C7.28595 22 4.92893 22 3.46447 20.5355C2 19.0711 2 16.714 2 12Z"
                        stroke="currentColor" stroke-width="1.5"></path>
                    <path opacity="0.5"
                        d="M17 2V8.8076C17 9.78253 17 10.27 16.8709 10.5607C16.5766 11.2233 15.8506 11.5805 15.1461 11.4095C14.8369 11.3344 14.4507 11.037 13.6782 10.4422C13.2421 10.1064 13.024 9.9385 12.797 9.83985C12.2886 9.61899 11.7114 9.61899 11.203 9.83985C10.976 9.9385 10.7579 10.1064 10.3218 10.4422C9.5493 11.037 9.16307 11.3344 8.85391 11.4095C8.14942 11.5805 7.42342 11.2233 7.12914 10.5607C7 10.27 7 9.78253 7 8.8076V2"
                        stroke="currentColor" stroke-width="1.5"></path>
                </svg>
            </div>

            <div id="nav-content" class="center-action" onclick="showView('content')">
                <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" viewBox="0 0 24 24" fill="none"
                    stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round">
                    <circle cx="12" cy="12" r="10" />
                    <path d="M8 12h8" />
                    <path d="M12 8v8" />
                </svg>
            </div>

            <div id="nav-shop" class="nav-item" onclick="showView('shop')">
                <svg class="w-7 h-7" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path
                        d="M6 2L3 6V20C3 20.5304 3.21071 21.0391 3.58579 21.4142C3.96086 21.7893 4.46957 22 5 22H19C19.5304 22 20.0391 21.7893 20.4142 21.4142C20.7893 21.0391 21 20.5304 21 20V6L18 2H6Z"
                        stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" />
                    <path opacity="0.5"
                        d="M3 6H21M16 10C16 11.0609 15.5786 12.0783 14.8284 12.8284C14.0783 13.5786 13.0609 14 12 14C10.9391 14 9.92172 13.5786 9.17157 12.8284C8.42143 12.0783 8 11.0609 8 10"
                        stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round" />
                </svg>
            </div>

            <div id="nav-contact" class="nav-item" onclick="showView('contact')">
                <svg class="w-7 h-7" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path
                        d="M8 10H8.01M12 10H12.01M16 10H16.01M21 11C21 15.4183 17.4183 19 13 19H12L7 22V19H6C3.79086 19 2 17.2091 2 15V7C2 4.79086 3.79086 3 6 3H17C19.2091 3 21 4.79086 21 7V11Z"
                        stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
            </div>
        </div>
    </div>

    <script>
        // CART LOGIC
        let cart = [];

        function addToCart(product) {
            const existingItem = cart.find(item => item.id === product.id);
            if (existingItem) {
                existingItem.quantity += 1;
            } else {
                cart.push({ ...product, quantity: 1 });
            }
            updateCartUI();
        }

        function removeFromCart(productId) {
            const index = cart.findIndex(item => item.id === productId);
            if (index > -1) {
                cart.splice(index, 1);
                updateCartUI();
            }
        }

        function updateQuantity(productId, newQuantity) {
            const item = cart.find(item => item.id === productId);
            if (item) {
                item.quantity = Math.max(1, newQuantity);
                updateCartUI();
            }
        }

        function updateCartUI() {
            const cartItems = document.getElementById('cart-items');
            const emptyCart = document.getElementById('empty-cart');
            const cartCount = document.getElementById('cart-count');
            const cartSubtotal = document.getElementById('cart-subtotal');
            const checkoutBtn = document.getElementById('checkout-btn');

            // Update cart count
            const totalItems = cart.reduce((sum, item) => sum + item.quantity, 0);
            cartCount.textContent = totalItems;

            // Get cart summary element
            const cartSummary = document.getElementById('cart-summary');

            // Show/hide empty state, cart items, and summary
            if (cart.length === 0) {
                emptyCart.classList.remove('hidden');
                cartItems.classList.add('hidden');
                cartSummary.classList.add('hidden');
                cartCount.classList.add('hidden');
                checkoutBtn.disabled = true;
                cartSubtotal.textContent = '$0.00';
                return;
            } else {
                emptyCart.classList.add('hidden');
                cartItems.classList.remove('hidden');
                cartSummary.classList.remove('hidden');
                cartCount.classList.remove('hidden');
            }

            // Calculate subtotal
            const subtotal = cart.reduce((sum, item) => sum + (item.price * item.quantity), 0);

            // Update cart items list
            cartItems.innerHTML = cart.map(item => `
                <div class="glass-panel p-4 rounded-2xl transition-all duration-300 hover:border-white/20">
                    <div class="flex items-start gap-4">
                        <div class="w-20 h-20 bg-white/5 rounded-xl overflow-hidden flex-shrink-0">
                            <img src="assets/images/placeholder.webp" alt="${item.name}" class="w-full h-full object-cover">
                        </div>
                        <div class="flex-1 min-w-0">
                            <h3 class="font-medium text-white/90 truncate">${item.name}</h3>
                            <p class="text-sm text-white/60 mb-2">${item.description || 'Premium digital asset'}</p>
                            
                            <div class="flex items-center justify-between mt-3">
                                <div class="flex items-center gap-2 bg-white/5 rounded-full px-3 py-1.5">
                                    <button onclick="updateQuantity('${item.id}', ${item.quantity - 1})" 
                                            class="w-6 h-6 flex items-center justify-center rounded-full hover:bg-white/10 text-white/70 hover:text-white transition-colors">
                                        <svg class="w-3.5 h-3.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M20 12H4" />
                                        </svg>
                                    </button>
                                    <span class="text-sm font-medium w-6 text-center">${item.quantity}</span>
                                    <button onclick="updateQuantity('${item.id}', ${item.quantity + 1})" 
                                            class="w-6 h-6 flex items-center justify-center rounded-full hover:bg-white/10 text-white/70 hover:text-white transition-colors">
                                        <svg class="w-3.5 h-3.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2.5" d="M12 4v16m8-8H4" />
                                        </svg>
                                    </button>
                                </div>
                                <div class="text-right">
                                    <p class="font-medium text-white/90">$${(item.price * item.quantity).toFixed(2)}</p>
                                    <p class="text-xs text-white/40">$${item.price.toFixed(2)} each</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <button onclick="removeFromCart('${item.id}')" 
                            class="absolute top-3 right-3 p-1.5 rounded-full hover:bg-white/10 text-white/40 hover:text-red-400 transition-colors">
                        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
                        </svg>
                    </button>
                </div>
            `).join('');

            // Update subtotal and enable checkout
            cartSubtotal.textContent = `$${subtotal.toFixed(2)}`;
            checkoutBtn.disabled = false;
        }

        // Project data for infinite scrolling
        const projects = [
            {
                id: 'project-1',
                title: 'Neural Net v4',
                description: 'Building the future of AI with neural networks that learn and adapt in real-time.',
                media: 'https://samplelib.com/lib/preview/mp4/sample-5s.mp4',
                mediaType: 'video',
                progress: 82,
                status: 'Active',
                author: 'klerry',
                authorImage: 'https://i.pravatar.cc/150?u=klerry'
            },
            {
                id: 'project-2',
                title: 'Quantum UI',
                description: 'Revolutionizing user interfaces with quantum computing principles for unprecedented performance.',
                media: 'https://samplelib.com/lib/preview/mp4/sample-10s.mp4',
                mediaType: 'video',
                progress: 65,
                status: 'Active',
                author: 'quantumdev',
                authorImage: 'https://i.pravatar.cc/150?u=quantumdev'
            },
            {
                id: 'project-3',
                title: 'AI Assistant',
                description: 'Creating intelligent assistants that understand and anticipate user needs through advanced machine learning.',
                media: 'https://samplelib.com/lib/preview/mp4/sample-15s.mp4',
                mediaType: 'video',
                progress: 45,
                status: 'In Progress',
                author: 'aidev',
                authorImage: 'https://i.pravatar.cc/150?u=aidev'
            },
            {
                id: 'project-4',
                title: 'Blockchain Explorer',
                description: 'A next-generation blockchain explorer with real-time analytics and visualization tools.',
                media: 'https://images.unsplash.com/photo-1639762681057-408e52192e55?q=80&w=1000',
                mediaType: 'image',
                progress: 28,
                status: 'In Progress',
                author: 'blockchainpro',
                authorImage: 'https://i.pravatar.cc/150?u=blockchainpro'
            },
            {
                id: 'project-5',
                title: 'AR Navigation Demo',
                description: 'Augmented reality navigation system for indoor and outdoor environments with real-time updates.',
                media: 'https://player.vimeo.com/external/449759238.sd.mp4?s=d5f3da46ddc17aa69a7d84ce3b9b6b4bb8958aa6&profile_id=165&oauth2_token_id=57447761',
                mediaType: 'video',
                thumbnail: 'https://images.unsplash.com/photo-1620641788421-7a1c342ea42e?q=80&w=1000',
                progress: 15,
                status: 'Planning',
                author: 'ardev',
                authorImage: 'https://i.pravatar.cc/150?u=ardev'
            },
            {
                id: 'project-6',
                title: 'Smart Home Hub',
                description: 'Centralized control for all your smart home devices with AI-powered automation.',
                media: 'https://player.vimeo.com/external/443834525.sd.mp4?s=8a2a2a8a2a2a8a2a2a8a2a2a8a2a2a8a2a2a8a2a2a&profile_id=165&oauth2_token_id=57447761',
                mediaType: 'video',
                thumbnail: 'https://images.unsplash.com/photo-1558002038-1055907df827?q=80&w=1000',
                progress: 92,
                status: 'Active',
                author: 'smarthome',
                authorImage: 'https://i.pravatar.cc/150?u=smarthome'
            },
            {
                id: 'project-7',
                title: 'Neural Art Generator',
                description: 'Transform your photos into stunning artworks using advanced neural style transfer algorithms.',
                media: 'https://player.vimeo.com/external/450628065.sd.mp4?s=3f8e2f8e2f8e2f8e2f8e2f8e2f8e2f8e2f8e2f8e&profile_id=165&oauth2_token_id=57447761',
                mediaType: 'video',
                thumbnail: 'https://images.unsplash.com/photo-1618005182384-a83a8bd57fbe?q=80&w=1000',
                progress: 78,
                status: 'Active',
                author: 'aiartist',
                authorImage: 'https://i.pravatar.cc/150?u=aiartist'
            },
            {
                id: 'project-8',
                title: 'VR Fitness Platform',
                description: 'Immersive fitness experience that makes working out fun and engaging through virtual reality.',
                media: 'https://player.vimeo.com/external/442543882.sd.mp4?s=8a2a2a8a2a2a8a2a2a8a2a2a8a2a2a8a2a2a8a2a2a&profile_id=165&oauth2_token_id=57447761',
                mediaType: 'video',
                thumbnail: 'https://images.unsplash.com/photo-1571019613454-1cb2f99b2d8b?q=80&w=1000',
                progress: 34,
                status: 'In Progress',
                author: 'vrfit',
                authorImage: 'https://i.pravatar.cc/150?u=vrfit'
            },
            {
                id: 'project-9',
                title: 'Autonomous Drone Delivery',
                description: 'Revolutionizing last-mile delivery with autonomous drones and smart routing algorithms.',
                media: 'https://player.vimeo.com/external/442543882.sd.mp4?s=8a2a2a8a2a2a8a2a2a8a2a2a8a2a2a8a2a2a8a2a2a&profile_id=165&oauth2_token_id=57447761',
                mediaType: 'video',
                thumbnail: 'https://images.unsplash.com/photo-1579829366248-204ba8666c59?q=80&w=1000',
                progress: 22,
                status: 'Planning',
                author: 'dronetech',
                authorImage: 'https://i.pravatar.cc/150?u=dronetech'
            },
            {
                id: 'project-10',
                title: 'AI Music Composer',
                description: 'Create beautiful, original music with the help of artificial intelligence and machine learning.',
                media: 'https://player.vimeo.com/external/450628065.sd.mp4?s=3f8e2f8e2f8e2f8e2f8e2f8e2f8e2f8e2f8e2f8e&profile_id=165&oauth2_token_id=57447761',
                mediaType: 'video',
                thumbnail: 'https://images.unsplash.com/photo-1508700115892-45ecd05ae2ad?q=80&w=1000',
                progress: 65,
                status: 'Active',
                author: 'musicaidev',
                authorImage: 'https://i.pravatar.cc/150?u=musicaidev'
            },
            {
                id: 'project-11',
                title: 'Smart City Dashboard',
                description: 'Real-time monitoring and analytics platform for smart city infrastructure and services.',
                media: 'https://player.vimeo.com/external/443834525.sd.mp4?s=8a2a2a8a2a2a8a2a2a8a2a2a8a2a2a8a2a2a8a2a2a&profile_id=165&oauth2_token_id=57447761',
                mediaType: 'video',
                thumbnail: 'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?q=80&w=1000',
                progress: 87,
                status: 'Active',
                author: 'smartcity',
                authorImage: 'https://i.pravatar.cc/150?u=smartcity'
            },
            {
                id: 'project-12',
                title: 'AR Shopping Assistant',
                description: 'Try before you buy with our augmented reality shopping experience that brings products to life.',
                media: 'https://player.vimeo.com/external/449759238.sd.mp4?s=d5f3da46ddc17aa69a7d84ce3b9b6b4bb8958aa6&profile_id=165&oauth2_token_id=57447761',
                mediaType: 'video',
                thumbnail: 'https://images.unsplash.com/photo-1602810319428-019690571b5b?q=80&w=1000',
                progress: 42,
                status: 'In Progress',
                author: 'arshop',
                authorImage: 'https://i.pravatar.cc/150?u=arshop'
            }
        ];

        // Infinite scroll variables
        let currentPage = 1;
        const projectsPerPage = 6;
        let isLoading = false;
        const projectsGrid = document.querySelector('#view-projects .grid');
        const loadingIndicator = document.createElement('div');
        loadingIndicator.className = 'col-span-full text-center py-8 text-white/40';
        loadingIndicator.innerHTML = 'Loading more projects...';
        loadingIndicator.style.display = 'none';
        document.querySelector('#view-projects .grid').parentNode.appendChild(loadingIndicator);

        // Add CSS for card animations
        const style = document.createElement('style');
        style.textContent = `
            @keyframes fadeInUp {
                from {
                    opacity: 0;
                    transform: translateY(20px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }
            .project-card {
                opacity: 0;
                animation: fadeInUp 0.6s ease-out forwards;
                animation-play-state: paused;
            }
            .project-card.visible {
                animation-play-state: running;
            }
            .project-card:nth-child(1) { animation-delay: 0.1s; }
            .project-card:nth-child(2) { animation-delay: 0.15s; }
            .project-card:nth-child(3) { animation-delay: 0.2s; }
            .project-card:nth-child(4) { animation-delay: 0.25s; }
            .project-card:nth-child(5) { animation-delay: 0.3s; }
            .project-card:nth-child(6) { animation-delay: 0.35s; }
        `;
        document.head.appendChild(style);

        // Initialize Intersection Observer for scroll animations and auto-play
        let observer;

        function initScrollAnimations() {
            observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    // Animation Logic
                    if (entry.isIntersecting) {
                        entry.target.classList.add('visible');
                    }

                    // Video Autoplay Logic
                    const video = entry.target.querySelector('video');
                    const playBtn = entry.target.querySelector('.play-button');

                    if (video) {
                        if (entry.isIntersecting) {
                            // Video entered viewport: Play it
                            video.play().then(() => {
                                // Update button state
                                if (playBtn) {
                                    playBtn.style.opacity = '0';
                                    playBtn.style.transform = 'translate(-50%, -50%) scale(1.5)';
                                    playBtn.style.pointerEvents = 'none';
                                }
                            }).catch(e => {
                                console.log('Autoplay prevented:', e);
                                if (playBtn) {
                                    playBtn.style.opacity = '1';
                                    playBtn.style.transform = 'translate(-50%, -50%) scale(1)';
                                    playBtn.style.pointerEvents = 'auto';
                                }
                            });
                        } else {
                            // Video left viewport: Pause it
                            video.pause();
                            // Optional: Reset to start
                            video.currentTime = 0;
                            // Reset button state
                            if (playBtn) {
                                playBtn.style.opacity = '1';
                                playBtn.style.transform = 'translate(-50%, -50%) scale(1)';
                                playBtn.style.pointerEvents = 'auto';
                            }
                        }
                    }
                });
            }, {
                threshold: 0.6, // Only play when 60% visible
                rootMargin: '0px'
            });
        }

        // Helper function to toggle video play/pause
        function toggleVideo(container) {
            const video = container.querySelector('video');
            const playBtn = container.querySelector('.play-button');

            if (!video || !playBtn) return;

            if (video.paused) {
                video.play();
                playBtn.style.opacity = '0';
                playBtn.style.transform = 'translate(-50%, -50%) scale(1.5)';
                playBtn.style.pointerEvents = 'none'; // Let clicks pass through to video
            } else {
                video.pause();
                playBtn.style.opacity = '1';
                playBtn.style.transform = 'translate(-50%, -50%) scale(1)';
                playBtn.style.pointerEvents = 'auto'; // Capture click to play again
            }
        }

        // Function to create project card HTML
        function createProjectCard(project) {
            // Determine if this is a video project
            const isVideo = project.mediaType === 'video';

            return `
                <div class="project-card w-full h-screen snap-start relative overflow-hidden">
                    <div class="relative w-full h-full group">
                        <!-- Media Content (Video or Image) -->
                        ${isVideo ? `
                            <div class="video-container" onclick="toggleVideo(this)">
                                <video 
                                    class="video-player" 
                                    ${project.thumbnail ? `poster="${project.thumbnail}"` : ''}
                                    preload="metadata"
                                    loop
                                    muted
                                    autoplay
                                    playsinline
                                >
                                    <source src="${project.media}" type="video/mp4">
                                    Your browser does not support the video tag.
                                </video>
                                <!-- Button hidden by default (opacity: 0) because of autoplay -->
                                <div class="play-button" style="opacity: 0; transform: translate(-50%, -50%) scale(1.5); pointer-events: none;">
                                    <svg viewBox="0 0 24 24">
                                        <path d="M8 5v14l11-7z"></path>
                                    </svg>
                                </div>
                            </div>
                        ` : `
                            <img src="assets/images/placeholder.webp" alt="${project.title}" class="w-full h-full object-cover">
                        `}
                        
                        <!-- Gradient Overlay -->
                        <div class="absolute inset-0 bg-gradient-to-t from-black/90 via-black/20 to-transparent pointer-events-none"></div>
                        
                        <!-- Action Buttons (Right Side) -->
                        <div class="action-buttons">
                            <!-- Like -->
                            <div class="action-button like" onclick="event.stopPropagation(); this.classList.toggle('active')">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z" />
                                </svg>
                                <span class="action-count">${Math.floor(Math.random() * 100)}</span>
                            </div>
                            
                            <!-- Comment -->
                            <div class="action-button" onclick="event.stopPropagation()">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 12h.01M12 12h.01M16 12h.01M21 12c0 4.418-4.03 8-9 8a9.863 9.863 0 01-4.255-.949L3 20l1.395-3.72C3.512 15.042 3 13.574 3 12c0-4.418 4.03-8 9-8s9 3.582 9 8z" />
                                </svg>
                                <span class="action-count">${Math.floor(Math.random() * 50)}</span>
                            </div>
                            
                            <!-- Share -->
                            <div class="action-button" onclick="event.stopPropagation()">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8.684 13.342C8.886 12.938 9 12.482 9 12c0-.482-.114-.938-.316-1.342m0 2.684a3 3 0 110-2.684m0 2.684l6.632 3.316m-6.632-6l6.632-3.316m0 0a3 3 0 105.367-2.684 3 3 0 00-5.367 2.684zm0 9.316a3 3 0 105.368 2.684 3 3 0 00-5.368-2.684z" />
                                </svg>
                                <span class="action-count">${Math.floor(Math.random() * 30)}</span>
                            </div>

                            <!-- Profile -->
                            <div class="action-button profile-button" onclick="event.stopPropagation()">
                                <img src="assets/images/placeholder.webp" alt="@${project.author}">
                            </div>
                        </div>
                        
                        <!-- Content Container -->
                        <div class="absolute inset-0 p-4 flex flex-col justify-end pointer-events-none">
                            <div class="mb-16 pointer-events-auto">
                                <div>
                                    <h3 class="font-bold text-2xl mb-2 text-white shadow-black drop-shadow-md">${project.title}</h3>
                                    <p class="text-base text-white/90 leading-relaxed drop-shadow-md">${project.description}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            `;
        }

        // Function to load more projects
        function loadMoreProjects() {
            if (isLoading) return;

            const startIndex = (currentPage - 1) * projectsPerPage;
            const endIndex = startIndex + projectsPerPage;
            const projectsToAdd = projects.slice(startIndex, endIndex);

            if (projectsToAdd.length === 0) {
                // No more projects to load
                loadingIndicator.textContent = 'No more projects to load';
                window.removeEventListener('scroll', handleScroll);
                return;
            }

            isLoading = true;
            loadingIndicator.style.display = 'block';

            // Simulate network delay
            setTimeout(() => {
                // Add new projects to the grid
                projectsToAdd.forEach((project, index) => {
                    const cardHTML = createProjectCard(project);
                    const tempDiv = document.createElement('div');
                    tempDiv.innerHTML = cardHTML.trim();
                    const cardElement = tempDiv.firstChild;

                    // Add staggered delay based on index
                    cardElement.style.animationDelay = `${index * 0.1}s`;

                    projectsGrid.appendChild(cardElement);

                    // Observe the new card
                    if (observer) {
                        observer.observe(cardElement);
                    }
                });

                currentPage++;
                isLoading = false;
                loadingIndicator.style.display = 'none';

                // If we've loaded all projects, update the loading message
                if ((currentPage - 1) * projectsPerPage >= projects.length) {
                    loadingIndicator.textContent = 'No more projects to load';
                    window.removeEventListener('scroll', handleScroll);
                }
            }, 800);
        }

        // Handle scroll event for infinite loading and snap
        function handleScroll() {
            const container = document.getElementById('view-projects');
            if (!container) return;

            const { scrollTop, scrollHeight, clientHeight } = container;

            // Load more when scrolled to 80% of the container
            if (scrollTop + clientHeight >= scrollHeight * 0.8) {
                loadMoreProjects();
            }
        }

        // Function to initialize infinite scroll
        function initInfiniteScroll() {
            console.log('Initializing infinite scroll...');

            // Get the projects grid container
            const projectsGrid = document.querySelector('#view-projects .grid');

            if (!projectsGrid) {
                console.error('Projects grid container not found!');
                return;
            }

            console.log('Projects grid found, loading initial projects...');

            // Initial load
            loadMoreProjects();

            // Add scroll event listener for infinite loading
            window.addEventListener('scroll', handleScroll);
            console.log('Infinite scroll initialized successfully');
        }

        // Tab switching functionality
        function setupTabs() {
            // Functionality placeholder
        }

        // Marketplace Filtering
        function setupMarketplaceFilters() {
            const filterButtons = document.querySelectorAll('.filter-btn');
            const assetItems = document.querySelectorAll('.asset-item');

            filterButtons.forEach(button => {
                button.addEventListener('click', () => {
                    // Update active state
                    filterButtons.forEach(btn => {
                        btn.classList.remove('active', 'bg-[#39FF14]', 'text-black');
                        btn.classList.add('glass-panel', 'text-white/80', 'hover:text-white');
                    });

                    button.classList.add('active', 'bg-[#39FF14]', 'text-black');
                    button.classList.remove('glass-panel', 'text-white/80', 'hover:text-white');

                    // Filter items
                    const category = button.dataset.category;

                    assetItems.forEach(item => {
                        if (category === 'all' || item.dataset.category === category) {
                            item.style.display = 'block';
                        } else {
                            item.style.display = 'none';
                        }
                    });
                });
            });
        }

        // Add more sample assets
        function addSampleAssets() {
            const assetList = document.getElementById('asset-list');

            // Sample assets data
            const sampleAssets = [
                {
                    category: 'fonts',
                    title: 'Modern Sans',
                    description: 'Clean and versatile sans-serif font family',
                    price: '24.99',
                    icon: 'M9.75 17L9 20l-1 1h8l-1-1-.75-3M3 13h18M5 17h14a2 2 0 002-2V5a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z'
                },
                {
                    category: 'illustrations',
                    title: 'Abstract Art Pack',
                    description: 'High-quality abstract illustrations',
                    price: '34.99',
                    icon: 'M4 16l4.586-4.586a2 2 0 012.828 0L16 16m-2-2l1.586-1.586a2 2 0 012.828 0L20 14m-6-6h.01M6 20h12a2 2 0 002-2V6a2 2 0 00-2-2H6a2 2 0 00-2 2v12a2 2 0 002 2z'
                },
                {
                    category: 'ui-kits',
                    title: 'Dark Mode UI Kit',
                    description: 'Complete dark theme components',
                    price: '39.99',
                    icon: 'M20.354 15.354A9 9 0 018.646 3.646 9.003 9.003 0 0012 21a9.003 9.003 0 008.354-5.646z'
                },
                {
                    category: 'templates',
                    title: 'Portfolio Template',
                    description: 'Minimal portfolio website template',
                    price: '29.99',
                    icon: 'M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4'
                }
            ];

            // Add sample assets to the list
            sampleAssets.forEach(asset => {
                const assetElement = document.createElement('div');
                assetElement.className = 'glass-panel p-4 rounded-2xl w-full asset-item';
                assetElement.dataset.category = asset.category;

                assetElement.innerHTML = `
                    <div class="aspect-square bg-white/5 rounded-xl flex items-center justify-center mb-3">
                        <svg class="w-10 h-10 text-white/60" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="${asset.icon}" />
                        </svg>
                    </div>
                    <h3 class="font-medium text-white/90 mb-1">${asset.title}</h3>
                    <p class="text-xs text-white/60 mb-2">${asset.description}</p>
                    <div class="flex justify-between items-center">
                        <span class="text-sm font-medium">$${asset.price}</span>
                        <button class="add-to-cart-btn text-xs bg-[#39FF14] hover:bg-[#2ee00c] text-black font-medium rounded-full px-3 py-1.5 transition-colors"
                            data-product-id="${asset.category}-${Math.floor(Math.random() * 1000)}" 
                            data-product-name="${asset.title}" 
                            data-product-price="${asset.price}">
                            Add to Cart
                        </button>
                    </div>
                `;

                assetList.appendChild(assetElement);
            });
        }

        // Initialize when DOM is fully loaded
        if (document.readyState === 'loading') {
            document.addEventListener('DOMContentLoaded', () => {
                initScrollAnimations();
                setupMarketplaceFilters();
                addSampleAssets();
                initInfiniteScroll();
                setupTabs();
            });
        } else {
            initScrollAnimations();
            initInfiniteScroll();
            setupTabs();
        }

        // Product data for the marketplace
        const products = [
            {
                id: 'ui-kit-1',
                name: 'Neon UI Kit',
                price: 29.99,
                description: 'Modern components with glowing effects',
                image: 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?q=80&w=1000',
                category: 'ui-kits'
            },
            {
                id: 'icon-pack-1',
                name: 'Premium Icon Pack',
                price: 19.99,
                description: '1000+ premium icons in various styles',
                image: 'https://images.unsplash.com/photo-1633356122102-3fe601e05bd2?q=80&w=1000',
                category: 'icons'
            },
            {
                id: 'dashboard-1',
                name: 'Dashboard Kit',
                price: 49.99,
                description: 'Complete dashboard templates with multiple layouts',
                image: 'https://images.unsplash.com/photo-1518770660439-4636190af475?q=80&w=1000',
                category: 'templates'
            },
            {
                id: '3d-icons-1',
                name: '3D Icons Pack',
                price: 24.99,
                description: 'Collection of 3D icons for modern interfaces',
                image: 'https://images.unsplash.com/photo-1633356122544-f134324a6cee?q=80&w=1000',
                category: '3d'
            }
        ];

        // Initialize the application
        document.addEventListener('DOMContentLoaded', function () {
            // Set home view as default
            showView('home');

            // Add to cart functionality
            document.querySelectorAll('.add-to-cart-btn').forEach(button => {
                button.addEventListener('click', function () {
                    const productId = this.getAttribute('data-product-id');
                    const product = products.find(p => p.id === productId);
                    if (product) {
                        addToCart(product);
                        // Show feedback
                        const originalText = this.innerHTML;
                        this.innerHTML = '✓ Added!';
                        this.classList.add('bg-green-400');
                        this.classList.remove('bg-[#39FF14]', 'hover:bg-[#2ee00c]');

                        // Reset button after 2 seconds
                        setTimeout(() => {
                            this.innerHTML = originalText;
                            this.classList.remove('bg-green-400');
                            this.classList.add('bg-[#39FF14]', 'hover:bg-[#2ee00c]');

                            // Update cart count in the UI if needed
                            updateCartCount();
                        }, 2000);
                    }
                });
            });

            // Update cart count on page load
            updateCartCount();
        });

        // Function to update cart count in the UI
        function updateCartCount() {
            const cartCount = document.getElementById('cart-count');
            if (cartCount) {
                const totalItems = cart.reduce((sum, item) => sum + item.quantity, 0);
                cartCount.textContent = totalItems > 0 ? totalItems : '';
                cartCount.style.display = totalItems > 0 ? 'flex' : 'none';
            }
        }

        // MEDIA HUB LOGIC
        const mediaItems = [
            {
                id: 'media1',
                type: 'video',
                title: 'Neural Network Demo',
                description: 'Real-time neural network visualization',
                thumbnail: 'https://images.unsplash.com/photo-1633356122102-3fe601e05bd2?w=500&auto=format&fit=crop&q=60',
                url: 'https://samplelib.com/lib/preview/mp4/sample-5s.mp4',
                duration: '0:30',
                aspectRatio: '9/16' // 1080x1350 aspect ratio
            },
            {
                id: 'media2',
                type: 'audio',
                title: 'Ambient Soundscape',
                description: 'Focus and productivity mix',
                thumbnail: 'https://images.unsplash.com/photo-1470229722913-7c0e2dbbafd3?w=500&auto=format&fit=crop&q=60',
                url: 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3',
                duration: '2:45'
            },
            {
                id: 'media3',
                type: 'image',
                title: 'AI Artwork #1',
                description: 'Generated with Stable Diffusion',
                thumbnail: 'https://images.unsplash.com/photo-1633356122544-f134324a6cee?w=500&auto=format&fit=crop&q=60',
                url: 'https://images.unsplash.com/photo-1633356122544-f134324a6cee?w=1080&auto=format&fit=crop&q=80',
                aspectRatio: '9/16' // 1080x1350 aspect ratio
            },
            {
                id: 'media4',
                type: 'video',
                title: '3D Animation',
                description: 'Procedural animation test',
                thumbnail: 'https://images.unsplash.com/photo-1551269901-5c5e14c25df7?w=500&auto=format&fit=crop&q=60',
                url: 'https://samplelib.com/lib/preview/mp4/sample-10s.mp4',
                duration: '1:15',
                aspectRatio: '9/16' // 1080x1350 aspect ratio
            }
        ];

        function renderMediaGrid(filter = 'all') {
            const grid = document.getElementById('media-grid');
            const filteredItems = filter === 'all'
                ? mediaItems
                : mediaItems.filter(item => item.type === filter);

            grid.innerHTML = filteredItems.map(item => `
                <div class="media-item group relative rounded-xl overflow-hidden bg-white/5 border border-white/10 hover:border-[#39FF14]/50 transition-colors cursor-pointer"
                     data-type="${item.type}" 
                     data-id="${item.id}">
                    <div class="aspect-[9/16] w-full relative">
                        <img src="assets/images/placeholder.webp" alt="${item.title}" class="w-full h-full object-cover">
                        ${item.type === 'video' ? `
                            <div class="absolute inset-0 flex items-center justify-center bg-black/30 opacity-0 group-hover:opacity-100 transition-opacity">
                                <div class="w-12 h-12 rounded-full bg-white/20 backdrop-blur-sm flex items-center justify-center">
                                    <svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 24 24">
                                        <path d="M8 5v14l11-7z"></path>
                                    </svg>
                                </div>
                            </div>
                            <div class="absolute bottom-2 right-2 bg-black/70 text-white text-xs px-2 py-1 rounded">
                                ${item.duration}
                            </div>
                        ` : ''}
                        ${item.type === 'audio' ? `
                            <div class="absolute inset-0 flex items-center justify-center bg-gradient-to-b from-black/30 to-black/70">
                                <div class="text-center p-4">
                                    <svg class="w-12 h-12 mx-auto text-white/80 mb-2" fill="currentColor" viewBox="0 0 24 24">
                                        <path d="M12 3v9.28a4.39 4.39 0 0 0-1.5-.28c-2.39 0-4.5 1.5-5.5 3.5 0 2.6 2.01 4.5 4.5 4.5s4.5-1.9 4.5-4.5V6h4V3h-6z"></path>
                                    </svg>
                                    <span class="text-white/60 text-xs">${item.duration}</span>
                                </div>
                            </div>
                        ` : ''}
                    </div>
                    <div class="p-3">
                        <h4 class="font-medium text-sm truncate">${item.title}</h4>
                        <p class="text-xs text-white/40 truncate">${item.description}</p>
                    </div>
                </div>
            `).join('');

            // Add click handlers to media items
            document.querySelectorAll('.media-item').forEach(item => {
                item.addEventListener('click', () => {
                    const mediaId = item.getAttribute('data-id');
                    const media = mediaItems.find(m => m.id === mediaId);
                    if (media) playMedia(media);
                });
            });
        }

        function playMedia(media) {
            const player = document.getElementById('media-player');
            const videoPlayer = document.getElementById('video-player');
            const audioPlayer = document.getElementById('audio-player');
            const imageViewer = document.getElementById('image-viewer');
            const mediaTitle = document.getElementById('media-title');
            const mediaDesc = document.getElementById('media-description');

            // Hide all players first
            videoPlayer.classList.add('hidden');
            audioPlayer.classList.add('hidden');
            imageViewer.classList.add('hidden');

            // Set media content based on type
            mediaTitle.textContent = media.title;
            mediaDesc.textContent = media.description;

            if (media.type === 'video') {
                videoPlayer.src = media.url;
                videoPlayer.classList.remove('hidden');
                videoPlayer.play();
            } else if (media.type === 'audio') {
                audioPlayer.src = media.url;
                audioPlayer.classList.remove('hidden');
                audioPlayer.play();
            } else if (media.type === 'image') {
                imageViewer.src = media.url;
                imageViewer.alt = media.title;
                imageViewer.classList.remove('hidden');
            }

            // Show the player modal
            player.classList.remove('hidden');
            document.body.style.overflow = 'hidden';
        }

        // Close player when clicking outside content
        document.getElementById('media-player').addEventListener('click', (e) => {
            if (e.target === document.getElementById('media-player')) {
                closePlayer();
            }
        });

        // Close player function
        function closePlayer() {
            const player = document.getElementById('media-player');
            const videoPlayer = document.getElementById('video-player');
            const audioPlayer = document.getElementById('audio-player');

            videoPlayer.pause();
            audioPlayer.pause();
            player.classList.add('hidden');
            document.body.style.overflow = '';
        }

        // Tab switching
        document.querySelectorAll('.media-tab').forEach(tab => {
            tab.addEventListener('click', () => {
                document.querySelectorAll('.media-tab').forEach(t => t.classList.remove('bg-white/10', 'text-white'));
                tab.classList.add('bg-white/10', 'text-white');
                const filter = tab.getAttribute('data-tab');
                renderMediaGrid(filter);
            });
        });

        // Close button
        document.getElementById('close-player').addEventListener('click', closePlayer);

        // Initialize media grid when view is shown
        document.getElementById('view-media').addEventListener('click', () => {
            renderMediaGrid();
        }, { once: true });

        // AI CHAT LOGIC
        const apiKey = ""; // Runtime provided
        const chatInput = document.getElementById('chat-input');
        const sendBtn = document.getElementById('send-btn');
        const chatMessages = document.getElementById('chat-messages');
        const typingIndicator = document.getElementById('typing-indicator');

        const systemPrompt = "You are the personal AI assistant for 'Klerry'. You are part of Klerry's NexGen Creative Hub. You know that Klerry is working on a 'Neural Net v4' project, has a marketplace for assets, and a creator studio. Keep your responses modern, tech-focused, and supportive. Be concise and helpful. Never mention you are an AI model; you are the Hub Assistant.";

        async function handleChat() {
            const query = chatInput.value.trim();
            if (!query) return;

            // Add user message
            addMessage(query, 'user');
            chatInput.value = '';
            typingIndicator.style.display = 'block';

            try {
                let retries = 0;
                let response;

                while (retries < 5) {
                    try {
                        const res = await fetch(`https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash-preview-09-2025:generateContent?key=${apiKey}`, {
                            method: 'POST',
                            headers: { 'Content-Type': 'application/json' },
                            body: JSON.stringify({
                                contents: [{ parts: [{ text: query }] }],
                                systemInstruction: { parts: [{ text: systemPrompt }] }
                            })
                        });
                        if (!res.ok) throw new Error();
                        response = await res.json();
                        break;
                    } catch (e) {
                        retries++;
                        await new Promise(r => setTimeout(r, Math.pow(2, retries) * 1000));
                    }
                }

                const aiText = response.candidates?.[0]?.content?.parts?.[0]?.text || "I'm having trouble connecting to the hub. Please try again.";
                addMessage(aiText, 'ai');
            } catch (err) {
                addMessage("Node failure. Check your connection.", 'ai');
            } finally {
                typingIndicator.style.display = 'none';
            }
        }

        function addMessage(text, role) {
            const msgDiv = document.createElement('div');
            msgDiv.className = `message message-${role}`;
            msgDiv.textContent = text;
            chatMessages.appendChild(msgDiv);
            chatMessages.scrollTo({ top: chatMessages.scrollHeight, behavior: 'smooth' });
        }

        sendBtn.addEventListener('click', handleChat);
        chatInput.addEventListener('keypress', (e) => { if (e.key === 'Enter') handleChat(); });

        // VIEW NAVIGATION
        function showView(viewId) {
            // Hide cart view if it's open
            const cartView = document.getElementById('view-cart');
            if (cartView) {
                cartView.style.display = 'none';
                cartView.classList.remove('active');
            }

            // If trying to open cart view
            if (viewId === 'cart') {
                if (cartView) {
                    // Hide main content
                    document.querySelector('main').style.display = 'none';
                    // Show cart view
                    cartView.style.display = 'flex';
                    cartView.classList.add('active');
                    updateCartUI();
                }
                return;
            }

            // For all other views
            document.querySelector('main').style.display = 'block';

            // Update active nav item
            document.querySelectorAll('.nav-item').forEach(item => item.classList.remove('active'));
            const activeNav = document.getElementById('nav-' + viewId);
            if (activeNav) activeNav.classList.add('active');

            // Hide all main views
            document.querySelectorAll('#view-home, #view-projects, #view-content, #view-shop, #view-media, #view-contact, #view-profile').forEach(view => {
                view.classList.remove('active');
                view.style.display = 'none';
            });

            // Show the selected view
            const targetView = document.getElementById('view-' + viewId);
            if (targetView) {
                targetView.classList.add('active');
                targetView.style.display = 'block';
            }

            document.querySelector('main').scrollTo({ top: 0, behavior: 'smooth' });
        }

        // AWESOME SEARCH FUNCTIONALITY
        const searchContainer = document.getElementById('search-container');
        const searchInput = document.getElementById('search-input');
        const searchToggle = document.getElementById('search-toggle');
        const profileButton = document.querySelector('.profile-button');
        const searchIcon = document.getElementById('search-icon-path');
        const closeIcon = document.getElementById('close-icon-path');

        function updateProfileVisibility(isSearchActive) {
            if (profileButton) {
                profileButton.style.opacity = isSearchActive ? '0' : '1';
                profileButton.style.pointerEvents = isSearchActive ? 'none' : 'auto';
            }
            // Toggle icons
            if (searchIcon && closeIcon) {
                searchIcon.style.opacity = isSearchActive ? '0' : '1';
                searchIcon.style.transform = isSearchActive ? 'scale(0.8)' : 'scale(1)';
                closeIcon.style.opacity = isSearchActive ? '1' : '0';
                closeIcon.style.transform = isSearchActive ? 'scale(1) rotate(0deg)' : 'scale(0.8) rotate(-90deg)';
            }
        }

        if (searchToggle && searchContainer) {
            searchToggle.addEventListener('click', (e) => {
                e.stopPropagation(); // Prevent document click from firing immediately

                const isActive = searchContainer.classList.contains('active');

                if (!isActive) {
                    // Open Search
                    searchContainer.classList.add('active');
                    searchInput.focus();
                    updateProfileVisibility(true);
                } else {
                    // Close Search (or Submit if text exists)
                    if (searchInput.value.trim() !== "") {
                        // Simulate search
                        console.log("Searching for:", searchInput.value);
                        // Optional: Add search logic here
                    }
                    searchContainer.classList.remove('active');
                    searchInput.blur();
                    updateProfileVisibility(false);
                }
            });

            // Close search when clicking outside
            document.addEventListener('click', (e) => {
                if (searchContainer.classList.contains('active') && !searchContainer.contains(e.target)) {
                    searchContainer.classList.remove('active');
                    searchInput.blur();
                    updateProfileVisibility(false);
                }
            });

            // Handle Enter key
            searchInput.addEventListener('keydown', (e) => {
                if (e.key === 'Enter') {
                    console.log("Searching for:", searchInput.value);
                    searchContainer.classList.remove('active');
                    searchInput.blur();
                    updateProfileVisibility(false);
                } else if (e.key === 'Escape') {
                    searchContainer.classList.remove('active');
                    searchInput.blur();
                    updateProfileVisibility(false);
                }
            });
        }

        // Filter chips
        document.querySelectorAll('.filter-chip').forEach(chip => {
            chip.addEventListener('click', function () {
                document.querySelectorAll('.filter-chip').forEach(c => c.classList.remove('active'));
                this.classList.add('active');
            });
        });
    </script>

</body>

</html>
