/** @type {import('next').NextConfig} */
const nextConfig = {
  // Disable SWC for compatibility in Docker builds
  swcMinify: false, 

  // Configure image optimization for remote sources
  images: {
    remotePatterns: [
      {
        protocol: 'https',
        hostname: 'i.imgur.com',
        port: '',
        pathname: '/**',
      },
      {
        protocol: 'https',
        hostname: 'images.unsplash.com',
        port: '',
        pathname: '/**',
      },
      {
        protocol: 'https',
        hostname: 'i.pravatar.cc',
        port: '',
        pathname: '/**',
      },
    ],
  },

  // Custom webpack configuration (if needed for specific builds)
  webpack: (config, { isServer }) => {
    if (!isServer) {
      // Ensure prisma is not bundled on the client side
      config.resolve.fallback.fs = false;
    }
    return config;
  },
};

export default nextConfig;
