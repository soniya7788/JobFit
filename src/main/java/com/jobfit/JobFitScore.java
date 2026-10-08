package com.jobfit;

public final class JobFitScore {

    private JobFitScore() {}

    public static int calculate(String company, String role, String jobType,
                                 String location, String status, String description) {

        int score = 35;

        String c = safe(company).toLowerCase();
        String r = safe(role).toLowerCase();
        String j = safe(jobType).toLowerCase();
        String l = safe(location).toLowerCase();
        String s = safe(status).toLowerCase();
        String d = safe(description).toLowerCase();

        String[] strongCompanies = {
            "google", "microsoft", "amazon", "apple", "meta", "adobe",
            "ibm", "cisco", "oracle", "accenture", "tcs", "infosys",
            "wipro", "cognizant", "capgemini", "deloitte", "ey", "pwc",
            "kpmg", "tech mahindra", "hcl", "ltimindtree"
        };

        for (String companyName : strongCompanies) {
            if (c.contains(companyName)) {
                score += 18;
                break;
            }
        }

        String[] valuableRoles = {
            "software engineer", "software developer", "java developer",
            "python developer", "full stack", "backend", "frontend",
            "qa", "tester", "data analyst", "devops", "cloud",
            "cyber security", "machine learning"
        };

        for (String roleName : valuableRoles) {
            if (r.contains(roleName)) {
                score += 10;
                break;
            }
        }

        if (j.contains("full time")) score += 8;
        else if (j.contains("remote")) score += 7;
        else if (j.contains("intern")) score += 4;
        else if (j.contains("contract")) score += 2;

        if (l.contains("remote")) score += 5;
        else if (l.contains("pune") || l.contains("bangalore")
                || l.contains("hyderabad") || l.contains("mumbai")
                || l.contains("chennai") || l.contains("delhi")) score += 3;

        if (s.contains("interviewing")) score += 8;
        else if (s.contains("offer")) score += 12;
        else if (s.contains("applied")) score += 3;

        if (!d.isBlank()) score += 4;

        return Math.max(0, Math.min(100, score));
    }

    public static String label(int score) {
        if (score >= 75) return "High Focus";
        if (score >= 55) return "Worth Watching";
        return "Standard";
    }

    public static String cssClass(int score) {
        if (score >= 75) return "priority-high";
        if (score >= 55) return "priority-medium";
        return "priority-normal";
    }

    private static String safe(String value) {
        return value == null ? "" : value;
    }
}
