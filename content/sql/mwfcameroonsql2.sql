-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 21, 2023 at 06:11 PM
-- Server version: 8.0.33-0ubuntu0.20.04.2
-- PHP Version: 7.4.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mwfcameroonsql2`
--

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` int UNSIGNED NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `link` varchar(150) DEFAULT NULL,
  `image` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_category_content`
--

CREATE TABLE `blog_category_content` (
  `id` int NOT NULL,
  `lang_id` int UNSIGNED DEFAULT '1',
  `category_id` int UNSIGNED DEFAULT NULL,
  `title` varchar(256) DEFAULT NULL,
  `description` mediumtext,
  `image_caption` varchar(512) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_posts`
--

CREATE TABLE `blog_posts` (
  `id` int UNSIGNED NOT NULL,
  `category_id` int UNSIGNED DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `author` int DEFAULT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `link` varchar(150) DEFAULT NULL,
  `image` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_post_content`
--

CREATE TABLE `blog_post_content` (
  `id` int UNSIGNED NOT NULL,
  `blog_id` int UNSIGNED NOT NULL,
  `last_update` datetime DEFAULT CURRENT_TIMESTAMP,
  `lang_id` int UNSIGNED DEFAULT '1',
  `title` varchar(150) NOT NULL,
  `description` mediumtext,
  `content` text,
  `image_caption` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carousel`
--

CREATE TABLE `carousel` (
  `id` int UNSIGNED NOT NULL,
  `category_id` int UNSIGNED DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `link` varchar(150) DEFAULT NULL,
  `image` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carousel`
--

INSERT INTO `carousel` (`id`, `category_id`, `is_active`, `link`, `image`) VALUES
(1, 1, 1, 'building-synergies-between-u-s--government-sponsor', 'carousel-building-synergi1679308512.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `carousel_categories`
--

CREATE TABLE `carousel_categories` (
  `id` int UNSIGNED NOT NULL,
  `link` varchar(150) DEFAULT NULL,
  `image` varchar(150) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carousel_categories`
--

INSERT INTO `carousel_categories` (`id`, `link`, `image`, `is_active`) VALUES
(1, 'homepage-carousel', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `carousel_category_content`
--

CREATE TABLE `carousel_category_content` (
  `id` int NOT NULL,
  `category_id` int UNSIGNED DEFAULT NULL,
  `lang_id` int DEFAULT '1',
  `title` varchar(200) DEFAULT NULL,
  `description` longtext,
  `image_caption` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carousel_category_content`
--

INSERT INTO `carousel_category_content` (`id`, `category_id`, `lang_id`, `title`, `description`, `image_caption`) VALUES
(1, 1, 1, 'Homepage Carousel', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `carousel_content`
--

CREATE TABLE `carousel_content` (
  `id` int UNSIGNED NOT NULL,
  `lang_id` int UNSIGNED DEFAULT '1',
  `carousel_id` int UNSIGNED NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `content` mediumtext,
  `image_caption` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carousel_content`
--

INSERT INTO `carousel_content` (`id`, `lang_id`, `carousel_id`, `title`, `content`, `image_caption`) VALUES
(1, 1, 1, 'Building synergies between U.S. Government-Sponsored Exchange Programs Alumni and leveraging youth potential through U.S. - Cameroon Cultural Exchange', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `contact_form_messages`
--

CREATE TABLE `contact_form_messages` (
  `id` int NOT NULL,
  `names` varchar(300) DEFAULT NULL,
  `email` varchar(300) NOT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `address` longtext,
  `file` varchar(300) DEFAULT NULL,
  `subject` varchar(300) DEFAULT NULL,
  `message` text NOT NULL,
  `contact_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_form_messages`
--

INSERT INTO `contact_form_messages` (`id`, `names`, `email`, `phone`, `address`, `file`, `subject`, `message`, `contact_date`, `status`) VALUES
(1, 'Yembe', 'nfor@yems.group', NULL, NULL, NULL, 'Test Message', 'Test Message.', '2023-03-26 08:29:34', NULL),
(2, 'Yembe', 'nfor@yems.group', NULL, NULL, NULL, 'Test', 'Test Message', '2023-03-26 08:31:42', NULL),
(3, 'Brianna Belton', 'briannabelton.mkt@gmail.com', NULL, NULL, NULL, 'Re: Want more clients and customers?', 'Hello,\r\n\r\nWe are interested to increase traffic to your website, please get back to us in order to discuss the possibility in further detail. \r\n\r\nPlease mention your phone number and suitable time to talk.\r\n\r\nThanks in advance!\r\nBrianna (SEO consultants)', '2023-03-28 09:52:06', NULL),
(4, 'Brianna Belton', 'briannabelton.mkt@gmail.com', NULL, NULL, NULL, 'Re: Want more clients and customers?', 'Hello,\r\n\r\nWe are interested to increase traffic to your website, please get back to us in order to discuss the possibility in further detail. \r\n\r\nPlease mention your phone number and suitable time to talk.\r\n\r\nThanks in advance!\r\nBrianna (SEO consultants)', '2023-03-28 09:52:07', NULL),
(5, 'Sharon Chan', 'sharonchan.tech@outlook.com', NULL, NULL, NULL, 'Question about your websites', 'How are you?\r\n\r\nCan we talk about your website?', '2023-03-29 18:04:32', NULL),
(6, 'Suilabayuh Ngah', 'ngahcarol34@gmail.com', NULL, NULL, NULL, 'I am above 35yrs and wish to add the event', 'Dear sir/madam, \r\nI am a Cameroonian of age 44yrs, a missionary, Theologian and human rights activist. I saw the advertisement and wish to be part of it.  I am the founder of Holding Hands Cameroon, President Elect, and Deputy Director of Conference, Events and Seminars for African Union Youth Assembly and undergraduate law student at the university of Buea. \r\n\r\nI wish to know how I can be part of this symposium \r\n\r\nHoping to hear from you,\r\nSuilabayuh Ngah \r\nTel: 675722435', '2023-04-10 07:39:04', NULL),
(7, 'MEPOGO Sabine Pulchérie', 'sabinemepogo632@gmail.com', NULL, NULL, NULL, 'Désir d\'intégrer l\'association', 'Quels sont les conditions à remplir pour intégrer de l\'association des élèves du programme d\'échange avec les Nations unies', '2023-04-11 09:31:54', NULL),
(8, 'Ngek Emlah Norah', 'gentlenorah@gmail.com', NULL, NULL, NULL, 'Eng/Lit', 'It will be a pleasure to experience this program', '2023-04-11 09:39:27', NULL),
(9, 'Ottou Monique', 'ottou_monique@yahoo.fr', NULL, NULL, NULL, 'S\'inscrire à la plateforme', 'Bjr je suis ancienne élève du Cameroun et j\'aimerais faire partie de votre association. Comment adhérer et participer aux activités et réunion ?', '2023-04-12 06:45:54', NULL),
(10, 'Kome Luther', 'komeluther@yahoo.com', NULL, NULL, NULL, 'RE: Invite Deadline', 'Please can I get an invite for the upcoming YALI conference? The deadline message is a shocker. I did not see it before and was not aware. Please I do look forward to a reply and thanks for your time.', '2023-04-17 15:39:47', NULL),
(11, 'RaymondKar', 'no.reply.KennethJohansson@gmail.com', NULL, NULL, NULL, 'Are you looking to draw in more customers for your business?', 'Hi! usgexchangeprogramscmr.org \r\n \r\nDid you know that it is possible to send commercial offer absolutely legit? We proffer a new and legal method of sending business offers through contact forms. These feedback forms can be seen on many sites. \r\nWhen such requests are sent, no personal data is used and messages are securely routed to forms designed to receive them and any subsequent appeals. Messages sent by Feedback Forms are not seen as spam since they are classified as essential. \r\nWe want you to trу our service without anу cost! \r\nYou can count on us for sending up to 50,000 messages. \r\n \r\nThe cost of sending one million messages is $59. \r\n \r\nThis offer is automatically generated. \r\nPlease use the contact details below to get in touch with us. \r\n \r\nContact us. \r\nTelegram - https://t.me/FeedbackFormEU \r\nSkype  live:feedbackform2019 \r\nWhatsApp  +375259112693 \r\nWhatsApp  https://wa.me/+375259112693 \r\n \r\nWe only use chat for communication.', '2023-04-27 00:45:18', NULL),
(12, 'Mila Ebonlo Arsène', 'arsenebonlo07@gmail.co', NULL, NULL, NULL, 'How to improve and manage my contact information. For a better growth developpement.', 'Hello \r\nI’m Mila E. Arsène from a Cameroonian standpoint advocacy for youth development mind and student. Moreover, A Youths Parliamentarians who is welling to contribute for a sustainable change and development. Also I needed to know more details about the youth development assistance leadership project that you offer and that can be helpful for the sustainable recovery development assistance for the population.\r\n\r\nThanks for your better understanding while waiting to receive from you. \r\n\r\nFacebook page: Hon. Arsène Mila \r\nGmail : arsenebonlo07@gmail.con\r\nWhatsap : 692108057\r\n\r\nYaoundé Cameroun 🇨🇲 \r\nYours sincerely', '2023-04-27 08:10:13', NULL),
(13, 'Mila Ebonlo Arsène', 'arsenebonlo07@gmail.co', NULL, NULL, NULL, 'Demande for attention', 'Love and rubbing for development goals achievements', '2023-04-27 08:13:24', NULL),
(14, 'NTEDE Désiré', 'ntedentede@outlook.com', NULL, NULL, NULL, 'Reports in need', 'ACEA 2021,\r\n\r\nThank you for your great job around the world and across the region and the rest of Cameroon. \r\n\r\nGeneral Secretary, \r\nACEACA', '2023-04-27 09:51:48', NULL),
(15, 'NTEDE Désiré', 'ntedentede@outlook.com', NULL, NULL, NULL, 'Reports in need', 'ACEA Alumni Cameroon,\r\n\r\nGeneral Secretary of ACEACA\r\nThank you for your great job around the world and across the region and the rest of Cameroon.', '2023-04-27 09:52:08', NULL),
(16, 'Daniel', 'support@newlightdigital.com.hubspot-inbox.com', NULL, NULL, NULL, '25 Point Website Usability Checklist', 'Hi there, \r\n \r\nUse this checklist to see if your website meets the minimum user experience requirements to rank on Google: \r\n \r\nhttps://newlightdigital.com/25-point-website-usability-checklist/ \r\n \r\nIf you are coming short, or not sure, just reach out to us for a free evaluation of your website. \r\n \r\nThanks, \r\nDaniel \r\n \r\n \r\n-- \r\n \r\nDaniel Todercan \r\nOwner, New Light Digital \r\nOur website: newlightdigital.com \r\nMy phone number: 917-744-9170', '2023-05-03 15:09:23', NULL),
(17, 'Mike Gimson', 'no-replyBata@gmail.com', NULL, NULL, NULL, 'Semrush Audit and fixes for usgexchangeprogramscmr.org', 'Good Day \r\n \r\nI have just took a look on your  usgexchangeprogramscmr.org for the current onsite SEO status and saw that your website has a handful of issues which should be addressed. \r\n \r\nNo matter what you are offering or selling, having a poor optimized site, full of bugs and errors, will never help your ranks. \r\n \r\nLet us fix your wordpress site errors today and get your ranks reach their full potential \r\n \r\nMore info: \r\nhttps://www.digital-x-press.com/product/wordpress-seo-audit-and-fix-service/ \r\n \r\n \r\nRegards \r\nMike Gimson', '2023-05-04 08:19:22', NULL),
(18, 'Stevendor', 'hello@odoziakuchi.com', NULL, NULL, NULL, 'Discover  Heirloom Jewellery With Meaning - Precious Metals', 'Good day! \r\n \r\nLooking for Heirloom fine Jewellery? \r\n \r\nODOZIAKUCHI is an exciting British jewellery brand that celebrates individuality, our mission is to create sentimental jewellery with meaning that move on to become heirlooms for generations. \r\n \r\nWe pride ourselves in making sustainable timeless jewellery with endless versatility and aesthetics we are driven to making fine jewellery that can be worn for everyday looks or occasional wear. \r\n \r\nWe pride ourselves in being open and honest, staying true to our mission. All our jewellery are hallmarked at the Assay Office in London which guarantees our customers of the authenticity of there jewels. \r\n \r\nWe welcome you to follow us on our journey to bringing a full range of jewellery pieces that tell a story. \r\n \r\nYou can visit our website and view our social media channels to get inspired! Simply click on the below links \r\n \r\nWebsite: https://odoziakuchi.com/ \r\n \r\nEmail: info@odoziakuchi.com \r\n \r\nBlog:https://odoziakuchi.com/ethical-diamonds/ \r\n \r\nInstagram: https://www.instagram.com/odoziakuchi/ \r\n \r\nFacebook: https://m.facebook.com/Odoziakuchi \r\n \r\nWe look forward to having you with us on this journey \r\n \r\nKind regards, \r\n \r\nODOZIAKUCHI', '2023-05-11 07:37:31', NULL),
(19, 'Mike Gilmore', 'no-replyBata@gmail.com', NULL, NULL, NULL, 'NEW: Semrush Backlinks', 'Greetings \r\n \r\nThis is Mike Gilmore\r\n \r\nLet me show you our latest research results from our constant SEO feedbacks that we have from our plans: \r\n \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nThe new Semrush Backlinks, which will make your usgexchangeprogramscmr.org SEO trend have an immediate push. \r\nThe method is actually very simple, we are building links from domains that have a high number of keywords ranking for them.  \r\n \r\nForget about the SEO metrics or any other factors that so many tools try to teach you that is good. The most valuable link is the one that comes from a website that has a healthy trend and lots of ranking keywords. \r\nWe thought about that, so we have built this plan for you \r\n \r\nCheck in detail here: \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nCheap and effective \r\n \r\nTry it anytime soon \r\n \r\n \r\nRegards \r\n \r\nMike Gilmore\r\n \r\nmike@strictlydigital.net', '2023-05-12 14:10:15', NULL),
(20, 'Santos Michael', 'santosmichaeluk@gmail.com', NULL, NULL, NULL, 'Partnership', 'Dear Sir/Madam, \r\n \r\nI was asked to contact you and Haven obtained your contact details from a reliable source as a potential partner. We are happy to introduce to you a woman with a Capital of 59.9 Million USD from Saudi Arabia searching for a good person to invest in your country.  We are a renowned investment-brokering agent in your country and we offer irresistible service investment providers from your country. \r\n \r\nWe are by this email letter offering you an irresistible joint (Partnership), so as to allow us to have you as our representative and manager of investment funds partnership in your country within the time frame of the investment relationship.  Since we cannot determine if this email is functional or valid and also your willingness, we have kept this proposal brief. \r\n \r\nWe are in the hope to share this irresistible offer with you based on a partnership investment program within your country.  If you are interested in this partnership, please respond with your direct telephone and give us your full contact details plus your company profile if any, and in your response, we will send you an elaborate email with details of this kind of offer on how to see face to face then email: info@linkinvestmentuk.com. \r\n \r\nYour expedient response will be appreciated. \r\n \r\nThank you. \r\n \r\nSantos Michael \r\nLondon, UK \r\n+(44) 74 52349949 \r\nLink Investment \r\nLondon \r\nUK', '2023-05-14 21:42:54', NULL),
(21, 'Mike Arthurs', 'no-replyBata@gmail.com', NULL, NULL, NULL, 'Domain Authority of your usgexchangeprogramscmr.org', 'Hi there \r\n \r\nJust checked your usgexchangeprogramscmr.org in MOZ and saw that you could use an authority boost. \r\n \r\nWith our service you will get a guaranteed Domain Authority score within just 3 months time. This will increase the organic visibility and strengthen your website authority, thus getting it stronger against G updates as well. \r\n \r\nFor more information, please check our offers \r\nhttps://www.monkeydigital.co/domain-authority-plan/ \r\n \r\nNEW: Semrush DA is now possible \r\nhttps://www.monkeydigital.co/semrush-da/ \r\n \r\nThanks and regards \r\nMike Arthurs', '2023-05-15 00:26:36', NULL),
(22, 'Greg Chait', 'gregchait1@gmail.com', NULL, NULL, NULL, 'Take Advantage Of The Employee Retention Credit (ERC)', 'Discover the Employee Tax Credit (ERC) - an amazing opportunity for businesses like yours to receive cash credits of up to $26,000 per employee through the Economic Retention Credit. Even if your company has already received other COVID-19 relief, you may still be eligible for this credit. Email ercrefunding2023@gmail.com to learn more. Don\'t miss out! \r\n \r\nBest regards, \r\n \r\nGreg Chait', '2023-05-15 22:23:23', NULL),
(23, 'Tigran Ayrapetyan', 'ujn2esbgakah@opayq.com', NULL, NULL, NULL, 'Capital Business Funding', 'Hello, \r\n \r\nWe provide funding through our venture capital company to both start-up and existing companies either looking for funding for expansion or to accelerate growth in their company. \r\nWe have a structured joint venture investment plan in which we are interested in an annual return on investment not more than 10% ROI. We are also currently structuring a convertible debt and loan financing of 3% interest repayable annually with no early repayment penalties. \r\n \r\nWe would like to review your business plan or executive summary to understand a much better idea of your business and what you are looking to do, this will assist in determining the best possible investment structure we can pursue and discuss more extensively. \r\n \r\n \r\nI hope to hear back from you soon. \r\n \r\nSincerely, \r\n \r\nTigran Ayrapetyan \r\nInvestment Director \r\nDevcorp International E.C. \r\nP.O Box 10236 Shop No. 305 \r\nFlr 3 Manama Centre, Bahrain \r\nEmail: tigran.a@devcorpinternationalec.com', '2023-05-18 05:16:54', NULL),
(24, 'Mike Arthurs', 'no-replyBata@gmail.com', NULL, NULL, NULL, 'Improve local visibility for usgexchangeprogramscmr.org', 'If you have a local business and want to rank it on google maps in a specific area then this service is for you. \r\n \r\nGoogle Map Stacking is one of the best ways to rank your GMB in a specific mile radius. \r\n \r\nMore info: \r\nhttps://www.speed-seo.net/product/google-maps-pointers/ \r\n \r\nThanks and Regards \r\nMike Arthurs\r\n \r\n \r\nPS: Want an all in one Local Plan that includes everything? \r\nhttps://www.speed-seo.net/product/local-seo-package/', '2023-05-18 05:58:57', NULL),
(25, 'Mike Conors', 'no-replyBata@gmail.com', NULL, NULL, NULL, 'AI Monthly SEO plans', 'Howdy \r\n \r\nI have just verified your SEO on  usgexchangeprogramscmr.org for  the current search visibility and saw that your website could use a boost. \r\n \r\nWe will enhance your ranks organically and safely, using state of the art AI and whitehat methods, while providing monthly reports and outstanding support. \r\n \r\nMore info: \r\nhttps://www.hilkom-digital.de/cheap-seo-packages/ \r\n \r\nRegards \r\nMike Conors', '2023-05-23 05:12:36', NULL),
(26, 'ODOZIAKUCHI', 'hello@odoziakuchi.com', NULL, NULL, NULL, 'Discover  Heirloom Jewellery With Meaning - Precious Metals', 'Good day! \r\n \r\nLooking for Heirloom fine Jewellery? \r\n \r\nODOZIAKUCHI is an exciting jewellery brand that celebrates individuality, our mission is to create sentimental jewellery with meaning that move on to become heirlooms for generations. \r\n \r\nWe pride ourselves in making sustainable timeless jewellery with endless versatility and aesthetics. We are driven to making fine jewellery that can be worn for everyday looks or occasional wear. \r\n \r\nWe pride ourselves in being open and honest, staying true to our mission. All our jewellery are hallmarked at the Assay Office in London which guarantees our customers of the authenticity of there jewels. \r\n \r\nWe welcome you to follow us on our journey to bringing a full range of jewellery pieces that tell a story. \r\n \r\nYou can visit our website and view our social media channels to get inspired! Simply click on the below links \r\n \r\nWebsite: https://odoziakuchi.com/ \r\n \r\nEmail: info@odoziakuchi.com \r\n \r\nBlog:https://odoziakuchi.com/ethical-diamonds/ \r\n \r\nInstagram: https://www.instagram.com/odoziakuchi/ \r\n \r\nFacebook: https://m.facebook.com/Odoziakuchi \r\n \r\nWe look forward to having you with us on this journey \r\n \r\nKind regards, \r\n \r\nODOZIAKUCHI', '2023-06-02 17:27:02', NULL),
(27, 'Mike Thomas', 'no-replyBata@gmail.com', NULL, NULL, NULL, 'Semrush Audit and fixes for usgexchangeprogramscmr.org', 'Hello \r\n \r\nI have just verified your  usgexchangeprogramscmr.org for onsite errors and saw that your website has a handful of issues which should be addressed. \r\n \r\nNo matter what you are offering or selling, having a poor optimized site, full of bugs and errors, will never help your ranks. \r\n \r\nLet us fix your wordpress site errors today and get your ranks reach their full potential \r\n \r\nMore info: \r\nhttps://www.digital-x-press.com/product/wordpress-seo-audit-and-fix-service/ \r\n \r\n \r\nRegards \r\nMike Thomas', '2023-06-03 01:40:01', NULL),
(28, 'Mila', 'buscatea.com@gmail.com', NULL, NULL, NULL, 'Elevate Your Business with Buscatea.com - Powerful Exposure 100k+ for Just €70!', 'Hi, I?m Mila from Buscatea \r\nI would like to offer you to supercharge your online presence with Buscatea.com posting. We\'re offering a spotlight on our platform - boasting over 100K monthly visitors, and Google News recognition. \r\nFor only €70, enjoy: \r\nTwo potent backlinks for robust SEO. \r\nInclusion in our widely visited Google News-recognized blog. \r\nMaximize your visibility and reach today! Interested? Let\'s chat! \r\nMy contact email is  office@buscatea.com \r\nhttps://buscatea.com \r\nKind Regars \r\nMila', '2023-06-05 15:48:41', NULL),
(29, 'Mike Dutton', 'no-replyBata@gmail.com', NULL, NULL, NULL, 'Domain Authority of your usgexchangeprogramscmr.org', 'Hi there \r\n \r\nJust checked your usgexchangeprogramscmr.org in MOZ and saw that you could use an authority boost. \r\n \r\nWith our service you will get a guaranteed Domain Authority score within just 3 months time. This will increase the organic visibility and strengthen your website authority, thus getting it stronger against G updates as well. \r\n \r\nFor more information, please check our offers \r\nhttps://www.monkeydigital.co/domain-authority-plan/ \r\n \r\nNEW: Semrush DA is now possible \r\nhttps://www.monkeydigital.co/semrush-da/ \r\n \r\nThanks and regards \r\nMike Dutton', '2023-06-08 11:37:22', NULL),
(30, 'Mike Wainwright', 'no-replyBata@gmail.com', NULL, NULL, NULL, 'NEW: Semrush Backlinks', 'Hi there \r\n \r\nThis is Mike Wainwright\r\n \r\nLet me present you our latest research results from our constant SEO feedbacks that we have from our plans: \r\n \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nThe new Semrush Backlinks, which will make your usgexchangeprogramscmr.org SEO trend have an immediate push. \r\nThe method is actually very simple, we are building links from domains that have a high number of keywords ranking for them.  \r\n \r\nForget about the SEO metrics or any other factors that so many tools try to teach you that is good. The most valuable link is the one that comes from a website that has a healthy trend and lots of ranking keywords. \r\nWe thought about that, so we have built this plan for you \r\n \r\nCheck in detail here: \r\nhttps://www.strictlydigital.net/product/semrush-backlinks/ \r\n \r\nCheap and effective \r\n \r\nTry it anytime soon \r\n \r\n \r\nRegards \r\n \r\nMike Wainwright\r\n \r\nmike@strictlydigital.net', '2023-06-09 11:31:24', NULL),
(31, 'Hamud Zayed Ali', 'projectdept@kanzalshamsprojectmgt.com', NULL, NULL, NULL, 'Financial Investment Funding – LOAN', 'Greetings, \r\n \r\nIt\'s a pleasure to connect with you, My name is Hamud Zayed Ali, am an investment consultant with RSL-Project Management Service C0, I have been mandated by the company to source for investment opportunities and companies seeking for funding, business loans, for its project(s). Do you have any investment or project that is seeking for capital to fund it? \r\n \r\nOur Investments financing focus is on: \r\n \r\nSeed Capital, Early-Stage, Start-Up Ventures, , Brokerage, Private Finance, Renewable Energy Project, Commercial Real Estate, Blockchain, Technology, Telecommunication, Infrastructure, Agriculture, Animal Breeding, Hospitality, Healthcare, Oil/Gas/Refinery. Application reserved for business executives and companies with proven business records in search of funding for expansion or forcapital investments.. \r\n \r\nKindly contact me for further details. \r\n \r\nawait your return e.mail soonest. \r\n \r\nRegards \r\n \r\nDr. Hamud Zayed Ali \r\n \r\nMIDDLE EAST DEBT LOAN FINANCE CONSULTING \r\nAddress: 72469 Jahra Road Shuwaikh Industrial, Kuwait \r\nTel: +96550422388 \r\nEmail: rsl.fudiciary@debtloanfinanceconsultant.com', '2023-06-12 18:58:54', NULL),
(32, 'Mike Thomson', 'no-replyBata@gmail.com', NULL, NULL, NULL, 'Improve local visibility for usgexchangeprogramscmr.org', 'If you have a local business and want to rank it on google maps in a specific area then this service is for you. \r\n \r\nGoogle Map Stacking is one of the best ways to rank your GMB in a specific mile radius. \r\n \r\nMore info: \r\nhttps://www.speed-seo.net/product/google-maps-pointers/ \r\n \r\nThanks and Regards \r\nMike Thomson\r\n \r\n \r\nPS: Want an all in one Local Plan that includes everything? \r\nhttps://www.speed-seo.net/product/local-seo-package/', '2023-06-18 02:14:07', NULL),
(33, 'HarryDeedy', 'noreplynonprofits@protonmail.com', NULL, NULL, NULL, 'Monthly 10k grant from Google - are you using it?', 'Hello, \r\nAs a nonprofit organization are you using Google Ad grant that Google gives to each qualifying nonprofit of up to 10000$ per month? \r\n \r\nIf you do, as a marketing agency we can guarantee better results on search campaigns (97% probability) or you don\'t pay the administration fee (we are offering an 80% discount for those that already have campaigns for management and improvements). \r\n \r\nIf you are interested, fill out the form on our website: \r\nhttps://www.nonprofitsadgrants.com/', '2023-06-19 11:25:44', NULL),
(34, 'Denis Hampl', 'contact@reachbros.com', NULL, NULL, NULL, 'Do you have capacity for new clients right now?', 'Hello, \r\n \r\nAfter reviewing your impressive website, I believe we have a valuable offer to help you get more clients affordably. \r\n \r\nWe help B2B businesses with client acquisition through our Global B2B Reach System. \r\n \r\nWe’ve been able to generate more than 130 leads and over $50,000 in revenue in 3 months for our latest client with our Global B2B Reach System. \r\n \r\nIf you are currently looking for new ways to acquire clients, be sure to check out our website: \r\n \r\nhttps://reachbros.com/ \r\n \r\nIf you’re interested in our unique solution, then please schedule a FREE Demo call with us to figure out how we can help you through this link: \r\n \r\nhttps://calendly.com/d/y7d-x44-zvv/15-minutes-demo-call \r\n \r\nBest regards, \r\nDenis Hampl \r\nCo-Founder at Reach Bros', '2023-06-20 19:15:19', NULL),
(35, 'BenDobia', 'topratecompany1@proton.me', NULL, NULL, NULL, 'Question for %domain%', 'Hi, very impressive what you have build here on %domain% and around your whole business. \r\n \r\nWe are looking to buy businesses like yours. Would you be generally interested in selling your business, if you would get the right offer? \r\n \r\nMy name is Ben and I represent a group of investors, we buy businesses like yours and give the owner freedom to take time for the next chapter in their life. \r\n \r\nSend us an email if you want more information: business-investforequity@proton.me \r\n \r\nTalk soon, Ben', '2023-06-21 08:31:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `email_subscriptions`
--

CREATE TABLE `email_subscriptions` (
  `id` int NOT NULL,
  `first_name` varchar(300) DEFAULT NULL,
  `last_name` varchar(300) DEFAULT NULL,
  `number` int DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `address` text,
  `city` varchar(100) DEFAULT NULL,
  `country` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int UNSIGNED NOT NULL,
  `category_id` int UNSIGNED DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `from_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `to_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `link` varchar(150) DEFAULT NULL,
  `venue` varchar(150) DEFAULT NULL,
  `image` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `category_id`, `is_active`, `from_date`, `to_date`, `link`, `venue`, `image`) VALUES
(1, NULL, 1, '2022-04-26 00:00:00', '2022-04-28 12:55:01', 'the-cameroon-alumni-national-symposium', 'Palais de Congres, Yaounde', 'project-the-cameroon-alum1679506845.jpg'),
(2, NULL, 1, '2023-04-27 12:55:26', '2023-04-29 12:00:00', 'the-cameroon-alumni-national-symposium--2nd-editio', 'ENAM, Yaounde', 'project-the-cameroon-alum1679507435.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `event_categories`
--

CREATE TABLE `event_categories` (
  `id` int UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `link` varchar(150) NOT NULL,
  `image` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `event_category_content`
--

CREATE TABLE `event_category_content` (
  `id` int UNSIGNED NOT NULL,
  `lang_id` int UNSIGNED DEFAULT '1',
  `category_id` int UNSIGNED NOT NULL,
  `title` varchar(300) DEFAULT NULL,
  `description` text,
  `image_caption` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `event_content`
--

CREATE TABLE `event_content` (
  `id` int UNSIGNED NOT NULL,
  `lang_id` int UNSIGNED DEFAULT '1',
  `event_id` int UNSIGNED NOT NULL,
  `last_update` varchar(150) DEFAULT NULL,
  `title` varchar(300) DEFAULT NULL,
  `description` mediumtext,
  `content` text,
  `image_caption` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `event_content`
--

INSERT INTO `event_content` (`id`, `lang_id`, `event_id`, `last_update`, `title`, `description`, `content`, `image_caption`) VALUES
(1, 1, 1, NULL, 'The Cameroon Alumni National Symposium', NULL, '<p>The 1st Edition of the Cameroon Alumni National symposium organized from the in April 2021 under the theme &ldquo;Building Synergies Between U.S Exchange Programs Alumni and Leveraging Youth Potential Through U.S -Cameroon Cultural Exchange&rdquo; sought to build synergy and enhance collaboration among Alumni of U.S. Government-sponsored Exchange Programs, contributing to their personal and professional development in a bit to forge better partnerships for nation-building.&nbsp;</p>\r\n<p>The symposium brought together over 300 participants from U.S. Government-sponsored Exchange Programs, government officials, youth leaders, and civic leaders from across the national territory.&nbsp; For the first time, alumni from 14 U.S. Government-sponsored Exchange Programs were brought together, wherein, 161 alumni registered present at the symposium.&nbsp;&nbsp;</p>\r\n<p>Through this symposium, the US Embassy in Cameroon sought to give more visibility to it exchange programs and the impact they have had in Cameroon. It equally seeks to reorganize all its Alumni associations within the National Territory and bring them under one umbrella organization to better manage its intervention in the development of Cameroon&rsquo;s youths through these Alumni Associations. This symposium will include Panel Discussions, Networking Sessions, Cultural exposition, exhibitions, creation of a Cameroon U.S Funded Exchange Program Alumni Professional Digital Platform, and finally the Creation of a Canopy Alumni Association.</p>\r\n<p>GOAL: The main goal of this project is to build synergy and enhance collaboration among alumni of US government-funded exchange programs, contributing to their personal and professional development in a bit to forge better partnerships for national building.&nbsp;&nbsp;</p>\r\n<h3>OBJECTIVES</h3>\r\n<ol>\r\n<li>To organize a three (3) day Cameroon National Alumni symposium that will bring together 150 alumni from all US government-funded exchange programs by April 2022.</li>\r\n<li>To enhance PAS Cameroon alumni engagement by March 2022</li>\r\n<li>To Create an umbrella association or Platform for collaboration that will bring together alumni from all exchange programs sponsored by the U.S. Government by April 2022</li>\r\n</ol>\r\n<h3>ACTIVITIES&nbsp;&nbsp;</h3>\r\n<ol>\r\n<li>Organize plenary and parallel thematic discussion sessions.</li>\r\n<li>Organize social/cultural activities to showcase American and US culture.</li>\r\n<li>Carry out site events to brainstorm on collaborative projects for implementation among Alumni that address youth issues to enhance engagement and collaboration among alumni.&nbsp;&nbsp;</li>\r\n<li>Organize panel discussions for the evaluation of past alumni projects and sharing of experiences vis a vis post-fellowship expectations.</li>\r\n<li>Create an Umbrella Association or Platform for collaboration</li>\r\n<li>Create a Digital Platform for engagement</li>\r\n</ol>', NULL),
(2, 1, 2, NULL, 'The Cameroon Alumni National Symposium (2nd Edition)', NULL, '<h3>Theme: Driving Youth Actions for Cameroon&rsquo;s Economic Development.</h3>\r\n<p>The Cameroon Alumni National symposium is a U.S. Embassy-funded project, which seeks to build synergy and enhance collaboration among alumni of U.S. government-sponsored exchange programs, contributing to their personal and professional development in a bit to forge better partnerships for nation-building.&nbsp; &nbsp;The first edition which held last year was a great success which gathered more than 300 alumni and non-alumni from all over the nation.&nbsp; The recommendations and outcomes of last year therefore form the basis of implementation of the second edition. This year&rsquo;s symposium is a three-day event organized under the theme &ldquo;Driving Youth Actions for Cameroon&rsquo;s Economic Development&rdquo;.&nbsp;</p>\r\n<p>This event will bring together over 300 participants. These include representatives from the U.S. Embassy, Government officials, U.S. Government Exchange Program Alumni, Youth leaders, and CSO leaders from across the national territory.</p>\r\n<h3>Benefits</h3>\r\n<ul>\r\n<li>Networking opportunities with peers and change makers in all sectors of life;</li>\r\n<li>Learning opportunities through presentations and panel discussions with world class speakers on thematic cutting across civic, entrepreneurship, and public management.</li>\r\n<li>Fully funded for USG selected alumni.</li>\r\n<li>Opportunities to promote alumni associations and enhance alumni engagement.</li>\r\n<li>Participation in a cultural gala that showcases American and Cameroonian cultures.</li>\r\n</ul>\r\n<h3>Selection Criteria&nbsp;</h3>\r\n<p><strong>a) For Alumni&nbsp;</strong></p>\r\n<ul>\r\n<li>Open to all USG alumni.&nbsp;</li>\r\n<li>Priority given to new applicants (alumni who did not have the opportunity to attend the previous symposium);&nbsp;</li>\r\n<li>Ensure diversity, equity, and inclusion (This includes consideration of gender balance, alumni associations&rsquo; representation, and encouraging people with disabilities to ensure diverse representation on all symposium);&nbsp;&nbsp;</li>\r\n<li>Commitment to attend the entire 3-days program.&nbsp;</li>\r\n<li>Demonstration that the symposium will have maximum positive contribution by/impact the alumni in attendance.&nbsp;</li>\r\n</ul>\r\n<p><strong>b) For Non-Alumni&nbsp;</strong></p>\r\n<ul>\r\n<li>Youth leaders and Students between the ages of 15-35 years.&nbsp;</li>\r\n<li>Priority to applicants living in Yaounde (Note that no transportation nor accommodation will be provided).&nbsp;</li>\r\n<li>Priority given to new applicants (who did not have the opportunity to attend the previous symposium).&nbsp;</li>\r\n<li>Consideration given to former participants who capitalized on the skills gained and the resources obtained from the previous symposium.&nbsp;</li>\r\n<li>Ensure diversity and inclusion.</li>\r\n</ul>\r\n<p>Are you an alumnus of the United States Exchange Programs or not, apply now and connect with other young impactful leaders of the country on an exchange platform that promotes community and nation development.</p>', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` int UNSIGNED NOT NULL,
  `album_id` int UNSIGNED DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `image` varchar(150) DEFAULT NULL,
  `image_tags` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gallery_albums`
--

CREATE TABLE `gallery_albums` (
  `id` int UNSIGNED NOT NULL,
  `type` int UNSIGNED DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '1',
  `link` varchar(150) DEFAULT NULL,
  `image` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gallery_album_content`
--

CREATE TABLE `gallery_album_content` (
  `id` int UNSIGNED NOT NULL,
  `album_id` int UNSIGNED NOT NULL,
  `lang_id` int UNSIGNED DEFAULT '1',
  `title` varchar(300) DEFAULT NULL,
  `description` text,
  `image_caption` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gallery_content`
--

CREATE TABLE `gallery_content` (
  `id` int UNSIGNED NOT NULL,
  `gallery_id` int UNSIGNED DEFAULT NULL,
  `lang_id` int DEFAULT '1',
  `title` varchar(300) DEFAULT NULL,
  `image_caption` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int NOT NULL,
  `language` varchar(150) NOT NULL,
  `locale` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `language`, `locale`) VALUES
(1, 'English (US)', 'en_us'),
(2, 'French', 'fre');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int NOT NULL,
  `lang_id` int NOT NULL DEFAULT '1',
  `title` varchar(300) DEFAULT NULL,
  `description` text,
  `image` varchar(150) DEFAULT NULL,
  `image_caption` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `navs`
--

CREATE TABLE `navs` (
  `id` int NOT NULL,
  `link` varchar(150) DEFAULT NULL,
  `title` varchar(300) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `navs`
--

INSERT INTO `navs` (`id`, `link`, `title`, `description`) VALUES
(1, NULL, 'Main Menu', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `nav_links`
--

CREATE TABLE `nav_links` (
  `id` int NOT NULL,
  `nav_id` int DEFAULT NULL,
  `position` int DEFAULT NULL,
  `parent` int DEFAULT NULL,
  `link_type` int DEFAULT '1',
  `link` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `url` varchar(150) DEFAULT NULL,
  `image` varchar(300) DEFAULT NULL,
  `icon` varchar(300) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nav_links`
--

INSERT INTO `nav_links` (`id`, `nav_id`, `position`, `parent`, `link_type`, `link`, `url`, `image`, `icon`, `is_active`) VALUES
(1, 1, NULL, NULL, 1, 'welcome', NULL, NULL, NULL, 0),
(2, 1, NULL, NULL, 1, 'about', NULL, NULL, NULL, 1),
(3, 1, NULL, NULL, 1, 'programs', NULL, NULL, NULL, 1),
(4, 1, NULL, NULL, 1, 'activities', NULL, NULL, NULL, 1),
(5, 1, NULL, NULL, 1, 'news', NULL, NULL, NULL, 1),
(6, 1, NULL, NULL, 1, 'contact', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `nav_link_content`
--

CREATE TABLE `nav_link_content` (
  `id` int NOT NULL,
  `nav_link_id` int NOT NULL,
  `lang_id` int NOT NULL DEFAULT '1',
  `title` varchar(300) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `nav_link_content`
--

INSERT INTO `nav_link_content` (`id`, `nav_link_id`, `lang_id`, `title`, `description`) VALUES
(1, 1, 1, 'Welcome', NULL),
(2, 2, 1, 'About Us', NULL),
(3, 3, 1, 'Exchange Programs', NULL),
(4, 4, 1, 'Activities', NULL),
(5, 5, 1, 'News Center', NULL),
(6, 6, 1, 'Contact Us', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int UNSIGNED NOT NULL,
  `category_id` int UNSIGNED DEFAULT NULL,
  `author` int UNSIGNED DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `link` varchar(150) DEFAULT NULL,
  `image` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `category_id`, `author`, `is_active`, `date`, `link`, `image`) VALUES
(3, NULL, NULL, 1, '2023-03-24 17:58:12', 'applications-for-the-2nd-edition-of-the-symposium', 'news-applications-for-the1679309371.jpg'),
(4, NULL, NULL, 1, '2023-06-05 12:06:45', 'thank-you-for-participating-in-the-2nd-edition-of-', 'news-thank-you-for-partic1685966805.jpg'),
(5, NULL, NULL, 1, '2023-06-11 09:44:34', 'introducing-the-executive-board-of-the-u-s--exchan', 'news-introducing-the-exec1686476674.jpg'),
(6, NULL, NULL, 1, '2023-06-11 09:50:24', 'introducing-your-presidents', 'news-introducing-your-pre1686477024.jpg'),
(7, NULL, NULL, 1, '2023-06-11 09:53:42', 'moments-of-exchange-and-collaborations', 'news-moments-of-exchange-1686477222.jpg'),
(8, NULL, NULL, 1, '2023-06-11 09:58:06', 'recap-of-the-fantastic-things-some-alumni-did-last', 'news-recap-of-the-fantast1686477486.jpg'),
(9, NULL, NULL, 1, NULL, 'alumni-spotlight---nsang-rudolf', 'news-alumni-spotlight---n1686657924.jpg'),
(10, NULL, NULL, 1, '2023-06-13 12:15:58', 'expressing-our-gratitude-to-all-presidents-and-rep', 'news-expressing-our-grati1686658558.jpg'),
(11, NULL, NULL, 1, '2023-06-13 12:18:38', 'a-quick-note-to-alumni', 'news-a-quick-note-to-alum1686658718.jpg'),
(12, NULL, NULL, 1, '2023-06-13 12:20:41', 'volunteers-needed', 'news-volunteers-needed-im1686658841.jpg'),
(13, NULL, NULL, 1, NULL, 'alumni-spotlight---professor-tonjock-rosemary', 'news-alumni-spotlight---p1687269798.jpg'),
(14, NULL, NULL, 1, '2023-07-03 10:06:31', 'mandela-washington-fellows-2023-updates', 'news-mandela-washington-f1688378791.jpg'),
(15, 1, NULL, 1, '2023-07-05 11:13:34', 'apply-for-the--let-her-speak--information-session', 'news-apply-for-the--let-h1688555614.jpg'),
(16, 1, NULL, 1, NULL, 'nominate-a-woman-for-the--women-building-peace-awa', 'news-nominate-a-woman-for1688556199.jpg'),
(17, 1, NULL, 1, '2023-07-05 11:26:35', 'ambassador-lamora-launches-the-water-project-imple', 'news-ambassador-lamora-la1688556395.jpg'),
(18, 1, NULL, 1, NULL, 'alumni-of-the-week', 'news-alumni-of-the-week-i1688556479.jpg'),
(20, 1, NULL, 1, '2023-07-05 11:35:11', 'alumni-impact--sophie-ngassa--panelist-for-women-i', 'news-alumni-impact--sophi1688556911.jpg'),
(21, 1, NULL, 1, '2023-07-05 11:39:54', 'recap-of-alumni-spotlight-may-june', 'news-recap-of-alumni-spot1688557194.jpg'),
(23, 1, NULL, 1, '2023-07-05 11:55:22', 'rlc-alumni-are-having-the-rlc-tour-soon--register-', 'news-rlc-alumni-are-havin1688558122.jpg'),
(25, 1, NULL, 1, '2023-07-05 11:58:07', 'quick-tips-for-non-alumni', 'news-quick-tips-for-non-a1688558287.jpg'),
(26, 1, NULL, 1, NULL, 'alumni-spotlight---britney-berinyu-moukoko', 'news-alumni-spotlight---b1688558409.jpg'),
(27, 1, NULL, 1, '2023-07-05 12:12:36', 'applications-for-usepanc-volunteers-closed', 'news-applications-for-use1688559156.png'),
(28, 1, NULL, 1, NULL, 'in-loving-memory-of-the-his-majesty-bakary-bouba--', 'news-in-loving-memory-of-1689766261.png');

-- --------------------------------------------------------

--
-- Table structure for table `news_categories`
--

CREATE TABLE `news_categories` (
  `id` int UNSIGNED NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `link` varchar(150) DEFAULT NULL,
  `image` varchar(150) DEFAULT NULL,
  `status` int DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `news_categories`
--

INSERT INTO `news_categories` (`id`, `is_active`, `link`, `image`, `status`) VALUES
(1, 1, 'mandela-washington-fellows--cameroon-2023--updates', 'news-mandela-washington-f1688055541.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `news_category_content`
--

CREATE TABLE `news_category_content` (
  `id` int UNSIGNED NOT NULL,
  `lang_id` int UNSIGNED DEFAULT '1',
  `category_id` int UNSIGNED DEFAULT NULL,
  `title` varchar(300) DEFAULT NULL,
  `description` text,
  `image_caption` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `news_category_content`
--

INSERT INTO `news_category_content` (`id`, `lang_id`, `category_id`, `title`, `description`, `image_caption`) VALUES
(1, 1, NULL, 'Mandela Washington Fellows  Cameroon 2023. Updates', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `news_content`
--

CREATE TABLE `news_content` (
  `id` int UNSIGNED NOT NULL,
  `news_id` int UNSIGNED NOT NULL,
  `last_update` datetime DEFAULT NULL,
  `lang_id` int UNSIGNED DEFAULT NULL,
  `title` varchar(300) NOT NULL,
  `description` mediumtext,
  `content` text,
  `image_caption` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `news_content`
--

INSERT INTO `news_content` (`id`, `news_id`, `last_update`, `lang_id`, `title`, `description`, `content`, `image_caption`) VALUES
(3, 3, NULL, 1, 'Applications for the 2nd Edition of the Symposium are now open', NULL, '<p>The 2nd Edition of the Symposium of The Cameroon Alumni National symposium will be held from the <strong>26th â€“ 28th April 2023 at ENAM, Yaounde</strong></p>\n<p>The Cameroon Alumni National symposium is a U.S. Embassy-funded project, which seeks to build synergy and enhance collaboration among alumni of U.S. government-sponsored exchange programs, contributing to their personal and professional development in a bit to forge better partnerships for nation-building.</p>\n<p>Read more about the event and apply by following the link below</p>\n<a href=\"https://questionpro.com/t/AWcJ6Zwnta\" target=\"_blank\" class=\"btn btn-lg btn-custom-accent-green px-5 text-uppercase fw-bold\">Apply Now</a>', NULL),
(4, 4, NULL, 1, 'Thank you for participating in the 2nd Edition of the National Symposium', NULL, '<p>Hello here,</p>\r\n<p>A warm hug and hearty thanks to all who came from far and near to participate in the 2nd Edition of the National Symposium of the U.S. Exchange Programs Alumni Network Cameroon.</p>\r\n<p>We hope you are all back to your homes safe and sound and re-energised to continue being the changemakers and leaders that you are. </p>\r\n<p>We are grateful for the moments of sharing, of learning, of good humour and of cheers; and we look forward to collaborating with you. </p>\r\n<iframe width=\"100%\" height=\"530\" src=\"https://www.youtube.com/embed/eX1G-A4K4fY\" title=\"Cameroon National Alumni Symposium - US Government Exchange Programs in Cameroon. #YALI #eventshoot\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" allowfullscreen></iframe>\r\n<p><strong><a href=\"https://drive.google.com/drive/folders/1078Fq0Npsjx_-NooucbILlXD7-a8d4mI\" target=\"blank\">Images from the Event</a></strong></p>\r\n<p>In the meantime, remember to post all those beautiful moments. Don\'t forget to use the hashtag indicated ( #AlumniConnect2023 ) and tag the U.S. Embassy Yaounde.</p>\r\n<p>******</p>\r\n<p>Bonjour,</p>\r\n<p>Un grand merci à tous ceux qui sont venus de près ou de loin pour participer à la 2e édition du Symposium National des Boursiers des Programmes d\'Echange des États-Unis au Cameroun.</p>\r\n<p>Nous espérons que vous êtes tous de retour chez vous sains et saufs et revigorés pour continuer à être les acteurs du changement et les leaders que vous êtes.</p>\r\n<p>Nous sommes reconnaissants pour les moments de partage, d\'apprentissage, de bonne humeur et d\'acclamations ; et nous nous réjouissons de collaborer avec vous.</p>\r\n<p>En attendant, pensez à poster tous ces beaux moments. N\'oubliez pas d\'utiliser le hashtag indiqué (#AlumniConnect2023) et de taguer l\'Ambassade des États-Unis à Yaoundé.</p>\r\n<p>IVLP Alumni Association Cameroon</p>\r\n<p>Mandela Washington Fellows Cameroon - MWFC</p>\r\n<p>TechWomen Cameroon</p>\r\n<p>YALI WEST Africa- Alumni Association Cameroon </p>\r\n<p>AWEP Cameroon</p>\r\n<p>Yesalumni Cameroon </p>\r\n<p>Cameroon Fulbright TEA Alumni Association </p>\r\n<p>SUSI Alumni Association Cameroon </p>\r\n<p>#usalumninetwork #alumniconnect2023  #huberthumphreyscholars #communitysolutionsprogram #internationalwritingprogram #communityengagementexchangeprogram #techgirls</p>', NULL),
(5, 5, '2023-06-13 00:00:00', 1, 'Introducing the Executive Board of the U.S. Exchange Programs Alumni Network Cameroon', NULL, '<p>Elected during the 1st Edition of the National Symposium as the pioneer board for a 1-year term, 2022 was a moment of learning, discovery and setting foundations. During the General Assembly held on Day 3 of the 2nd edition of the National Symposium, 29th April, is a re-election for a 3 year term.</p>\r\n<p>\'We\'re thrilled to serve and explore with you the many ways that will connect our various alumni groups, encourage collaboration and build collective impact. We count on your support, your perspective and above all, your presence.\'</p>\r\n<p>Together, we are stronger.</p>\r\n<p><hr></p>\r\n<p>Présentation du Conseil D\'administration du Réseau des Anciens Boursiers des Programmes d\'Échange des Etats Unis au Cameroun.</p>\r\n<p>Élu lors de la 1ère édition du Symposium National comme conseil pionnier pour un mandat d\'un an, 2022 a été un moment d\'apprentissage et de découverte. Lors de l\'Assemblée générale tenue le jour 3 de la 2e édition du Symposium National, le 29 avril, est une réélection pour un mandat de 3 ans.</p>\r\n<p>\"Nous sommes ravis de servir et d\'explorer avec vous les nombreuses façons de connecter nos différents groupes, d\'encourager la collaboration et de créer un impact collectif. Nous comptons sur votre soutien.\'</p>\r\n<p>Ensemble, nous sommes plus forts</p>.<p>', NULL),
(6, 6, '2023-06-13 00:00:00', 1, 'Introducing your Presidents', NULL, '<p>Hello Dear Everyone,</p>\r\n<p>We are about to make your day lively.</p>\r\n<p>You probably know the President or Representative of your Alumni Association, but do you know the people with whom they will build the network?</p>\r\n<p>Well, here you go. We are extremely proud to be able to work with them and we hope you will support them in everywhere you can.</p>\r\n<p><hr></p>\r\n<p>Bonjour cher tout le monde,</p>\r\n<p>Nous sommes sur le point de vous donner du peps.</p>\r\n<p>Vous connaissez probablement le président ou le représentant de votre association d, mais connaissez-vous les personnes avec qui ils vont construire le réseau ?</p>\r\n<p>Eh bien, voilà. Nous sommes extrêmement fiers de pouvoir travailler avec eux et nous espérons que vous les soutiendrez quand vous le pourrez.</p>', NULL),
(7, 7, NULL, 1, 'Moments of Exchange and Collaborations', NULL, '<p>Hello here.</p>\r\n<p>We hope you are all good and making strides in every little effort you make to bring positive change.</p>\r\n<p>Appreciating the Alumni who attended the \'Meet and Greet\' with Community Engagement Exchange Program fellow from Cameroon Tomia and her IREX mentor Mr Thomas Sithole from Zimbabwe.</p>\r\n<p>It was a great moment of exchange and we hope, of future collaborations.</p>\r\n<p>Thank you Sama from the Mandela Washington Fellows Cameroon - MWFC , Hermann from the YES Alumni Cameroon , Arnaud from the YALI WEST Africa- Alumni Association Cameroon, Michèle from the TechWomen Cameroon, Clive and Rudolph from Children\'s Fate</p>\r\n<p>We look forward to many more occasions to exchange and collaborate.</p>', NULL),
(8, 8, NULL, 1, 'Recap of the fantastic things some Alumni did last week', NULL, '<p>Hello here, It\'s Friday, the weekend.</p>\r\n<p>Let\'s do a quick recap of the fantastic things some Alumni did last week. </p>\r\n<ol>\r\n    <li>Nkwa4change Solutions with the partnership of Women\'s Empowerment and the Family Center, Buea led by Nkembeteck Henry Nkwa and @Dogpima Stella had over 80 rural farmers learn how to produce and apply organic liquids fertilizer to boost their crop yield and protect the soil. They were also edified on Regenerative Agricultural Best Practices to adapt, mitigate and build resilience to climate change. </li>\r\n    <li>MDDT Cameroon led by Clifford Niba Akonteh  organised a conference in Bamenda for Civilian Rights amidst the Anglophone Crisis. </li>\r\n    <li>Hope For A Better Tomorrow - HOBET led by Tembeng Eli-Anne Anwi organised an event for World Menstrual Hygiene Day to gift Menstrual kits and #EndPeriodStigma in Tiko.</li>\r\n</ol>\r\n<p><img src=\"https://scontent-los2-1.xx.fbcdn.net/v/t39.30808-6/350837030_197418942797914_2637778297359233872_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=8bfeb9&_nc_eui2=AeHZz1ZjREYYEpxxQgVoUj9IydWd7AWQdRjJ1Z3sBZB1GHhbyLmhx6_lYqy-yJBpiZoHYK1_dS16JklTyLTgSZQi&_nc_ohc=S0UiSX1n2wMAX8Tt9Ix&_nc_ht=scontent-los2-1.xx&oh=00_AfAcjVRS55STQRlcdBYdCXUZoYQvi4e6DuMpDTwr71sWkQ&oe=648A1563\" class=\"w-50\" alt=\"\"><img src=\"https://scontent-los2-1.xx.fbcdn.net/v/t39.30808-6/350512483_1382894915951878_7663941104574219283_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=8bfeb9&_nc_eui2=AeHNP1cNNDTq8neMdOMGpWEra8ColIe6P-hrwKiUh7o_6J8-eItXmi0h_KOkPRUIcsQuIyDpdTUdPHvaVq_ofVyX&_nc_ohc=jFeB4yMBnPsAX80jLsh&_nc_ht=scontent-los2-1.xx&oh=00_AfAwL0JZXw5TOobtCXlWLj-7bRvqBH44ZStGlq3C9OhWqA&oe=6489CF99\" class=\"w-50\" alt=\"\"><img src=\"https://scontent-los2-1.xx.fbcdn.net/v/t39.30808-6/349352566_1487191235020673_4237637220137359896_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=8bfeb9&_nc_eui2=AeFToOQHy1f3MvwDj164Cu4xLrpeMNxm_rIuul4w3Gb-smBpMHdAhp7lIo28ded5ArkHuKla2SH32FNoX93ezW14&_nc_ohc=9F3WpgMJH6kAX-Pa-qt&_nc_ht=scontent-los2-1.xx&oh=00_AfDvnJ8p95roVklnC2n7LbvORQIPQ5r-LqnLYbbAoU1LIg&oe=648AF87F\" class=\"w-50\" alt=\"\"><img src=\"https://scontent-los2-1.xx.fbcdn.net/v/t39.30808-6/350800281_1008654403388215_4496554646893779518_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=8bfeb9&_nc_eui2=AeHI5SN5Y2VsKjr7AYeAdMFA-EhBYNG69y_4SEFg0br3L_lXoAnrxntXeuzSspjLATIeW2csQ7vFhTsCzIY6puun&_nc_ohc=RXXtY_URH9IAX8DArU3&_nc_ht=scontent-los2-1.xx&oh=00_AfCA8TaePwZNirJMTAY51XO3bY6QKWEVDGVuojyiHERZ7A&oe=648A8401\" class=\"w-50\" alt=\"\"><img src=\"https://scontent-los2-1.xx.fbcdn.net/v/t39.30808-6/349355475_213142444937752_7859511987574516238_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=8bfeb9&_nc_eui2=AeGN5wA21pbwfiV9sXPFI-9GLyxWbhjjCC0vLFZuGOMILSh66fNa6vqZuKbYwXWzerGZmb9LK8L-uFW-1nRDw8Fo&_nc_ohc=6ZlXbbmFfb0AX_g8bXI&_nc_ht=scontent-los2-1.xx&oh=00_AfCgS1yflzqS5QQw_gvKRiA4A7SinZshy6dWkPik_535lw&oe=6489E390\" class=\"w-50\" alt=\"\"></p>', NULL),
(9, 9, '2023-07-05 00:00:00', 1, 'Alumni Spotlight - Nsang Rudolf. CSP', NULL, '<p>It\'s Tuesday, Tuesday!!!!!! It\'s Alumni Spotlight Day</p>\r\n<p>We are delighted to meet Nsang Rudolf, an alumnus of the 2021 Community Solutions Program.</p>\r\n<p>Rudolf is the Executive Director of Silver Lining Africa (SiLA), a local organization that supports young people in Cameroon in the areas of entrepreneurship, peacebuilding and leadership. He is also a teacher, author and poet and his latest publication is \'The Greatest Leader in the World\' (2022). Currently, he is undertaking a doctoral research thesis at the University of Yaound&eacute; 1.</p>\r\n<p>Rudolf has been leading SiLA since 2015 through carrying out numerous community development projects with disadvantaged young people in orphanages and rural areas. With the arrival of the Anglophone crisis in Cameroon, together with SiLA, resorted to training young displaced people from the North West and South West regions (IDPs) on basic skills in agricultural entrepreneurship, including poultry, fish, snails, mushrooms and tomato. Between 2021 and 2022, in collaboration with the International Peace Research Association (IPRA), directly trained and funded 50 internally displaced youth, the majority of whom now operate profitable farms and are able to care for themselves and their families.</p>\r\n<p>Rudolf is a peace and conflict resolution expert who has worked to promote peace and justice at the local and global levels. From 2021 to present, he has been working with IPRA to document the narratives of oppressed people across the globe. Among a number of international opportunities, he gave a presentation on the impact of forgiveness and reconciliation on good governance at the 2022 Global Impact Summit in Washington, DC, USA, organized by the IREX and funded by the US Department of State. He was equally a participant and presenter in a series of seminars in Juba, South Sudan, organized by the Organization for Non-violence, the African Peace Research Association, and the International Fellowship for Reconciliation.</p>\r\n<p>After the publication of his book, he launched an ongoing project to promote literacy and the spirit of transformational leadership among students in 50 secondary schools and universities in the Centre, Littoral, South West, and North West Regions of Cameroon. Added to this, Rudolf writes and publishes numerous articles on topics affecting youth development on www.medium.com.</p>\r\n<p>Rudolf N. Nsang is hardworking, patient, efficient, and diligent in whatever he does. He is not only creative but often champions innovative solutions to community problems, especially those affecting youth.</p>\r\n<p>&nbsp;</p>\r\n<hr>\r\n<p>&nbsp;</p>\r\n<p>Nous sommes Mardi, mardi !!!!!! C\'est la journ&eacute;e Alumni Spotlight</p>\r\n<p>Nous sommes ravis de rencontrer Nsang Rudolf, un ancien du programme de solutions communautaires 2021.</p>\r\n<p>Rudolf est le directeur ex&eacute;cutif de Silver Lining Africa (SiLA), une organisation locale qui soutiens les jeunes au Cameroun dans les domaines de l\'entrepreneuriat, de la consolidation de la paix et du leadership. Il est &eacute;galement enseignant, auteur et po&egrave;te et sa derni&egrave;re publication est \'The Greatest Leader in the World\' (2022). Actuellement, il entreprend une th&egrave;se de doctorat de recherche &agrave; l\'Universit&eacute; de Yaound&eacute; 1.</p>\r\n<p>Rudolf dirige SiLA depuis 2015 &agrave; travers la r&eacute;alisation de nombreux projets de d&eacute;veloppement communautaire avec des jeunes d&eacute;favoris&eacute;s dans des orphelinats et des zones rurales. Avec l\'arriv&eacute;e de la crise anglophone au Cameroun, avec SiLA, a eu recours &agrave; la formation de jeunes d&eacute;plac&eacute;s des r&eacute;gions du Nord-Ouest et du Sud-Ouest (PDI) sur les comp&eacute;tences de base en entrepreneuriat agricole, y compris la volaille, le poisson, les escargots, les champignons et la tomate. Entre 2021 et 2022, en collaboration avec l\'International Peace Research Association (IPRA), a directement form&eacute; et financ&eacute; 50 jeunes d&eacute;plac&eacute;s internes, dont la majorit&eacute; exploite d&eacute;sormais des fermes rentables et sont capable de prendre soin d\'eux-m&ecirc;mes et de leurs familles. .</p>\r\n<p>En tant qu\'expert en paix et en r&eacute;solution de conflits qui a travaill&eacute; pour promouvoir la paix, il a travaill&eacute; avec l\'IPRA pour documenter les r&eacute;cits des personnes opprim&eacute;es &agrave; travers le monde. Parmi un certain nombre d\'opportunit&eacute;s internationales, il a fait une pr&eacute;sentation sur l\'impact du pardon et de la r&eacute;conciliation sur la bonne gouvernance lors du Global Impact Summit 2022 &agrave; Washington, DC, &Eacute;tats-Unis, organis&eacute; par l\'IREX et financ&eacute; par le D&eacute;partement d\'&Eacute;tat am&eacute;ricain. Il a &eacute;galement particip&eacute; et pr&eacute;sent&eacute; une s&eacute;rie de s&eacute;minaires &agrave; Juba, au Soudan du Sud, organis&eacute;s par l\'Organisation pour la non-violence, l\'Association africaine de recherche sur la paix et l\'International Fellowship for Reconciliation.</p>\r\n<p>Apr&egrave;s la publication de son livre, il a lanc&eacute; un projet en cours pour promouvoir l\'alphab&eacute;tisation et l\'esprit de leadership transformationnel parmi les &eacute;l&egrave;ves de 50 &eacute;coles secondaires et universit&eacute;s des r&eacute;gions du Centre, du Littoral, du Sud-Ouest et du Nord-Ouest du Cameroun. De plus, Rudolf &eacute;crit et publie de nombreux articles sur des sujets touchant le d&eacute;veloppement des jeunes sur www.medium.com.</p>\r\n<p>Rudolf N. Nsang est travailleur, patient, efficace et appliqu&eacute; dans tout ce qu\'il entreprend. Il est non seulement cr&eacute;atif, mais d&eacute;fend souvent des solutions innovatrices aux probl&egrave;mes communautaires, en particulier ceux qui touchent les jeunes.</p>', NULL),
(10, 10, NULL, 1, 'Expressing our gratitude to all Presidents and Representatives', NULL, '<p>We hope you are doing excellent, being graceful with your challenges and grateful for your milestones. </p>\r\n<p>We\'re sharing an update and expressing our gratitude to all Presidents and Representatives for making the meeting of the Alumni Network a success. </p>\r\n<p>If you are Alumni of the U.S. Exchange Programs Alumni Network, please do not hesitate to reach out to your presidents/ representatives for the feedback and find out how you can contribute as associations and as individuals towards growing the network. </p>\r\n<p>Have a colorful weekend. </p>\r\n<p><hr></p>\r\n<p>Nous espérons que vous allez très bien, que vous êtes gracieux face aux défis et reconnaissants pour vos jalons. </p>\r\n<p>Nous exprimons notre gratitude à tous les présidents et représentants et leur remercions d\'avoir participé à la réunion et fait d\'elle un succès. </p>\r\n<p>Si vous faites parti de ce réseau en tant qu\'anciens boursiérs des programmes d\'échange des États-Unis, n\'hésitez pas à contacter vos présidents / représentants pour obtenir le compte rendu et découvrir comment vous pouvez contribuer en tant qu\'associations et en tant qu\'individus à la croissance du réseau. </p>\r\n<p>Passez un week-end haut en couleurs. </p>', NULL),
(11, 11, NULL, 1, 'A quick note to Alumni', NULL, '<p>A quick note to Alumni, </p>\r\n<p>Please do check your emails and register into the new ExchangeAlumni website for a beautiful and more enriching experience. </p>\r\n<p>This is the opportunity to register if you had not even done so since being an Alumni. </p>\r\n<p><hr></p>\r\n<p>Chèr(e)s Alumnis,</p>\r\n<p>Veuillez vérifier vos e-mails et vous inscrire sur le nouveau site Web ExchangeAlumni pour une expérience magnifique et plus enrichissante.</p>\r\n<p>C\'est l\'occasion de vous inscrire si vous ne l\'aviez même pas fait depuis que vous êtes Alumni.</p>', NULL),
(12, 12, '2023-06-13 00:00:00', 1, 'Volunteers Needed', NULL, '<p>Helllllllo our people. </p>\r\n<p>A call for volunteers is up; to make our network more dynamic, offer the opportunity to gain experience as a volunteer and meet the most inspiring people ever. </p>\r\n<p class=\"fw-bold\">*Open to both alumni and non-alumni. </p>\r\n<p>Application Deadline: 1st July. </p>\r\n<p>Application via this link / Postuler au lien qui suit: <br><a href=\"https://docs.google.com/forms/d/e/1FAIpQLSf7PGm3oswGzUSd56VVQaVFe7Gmk0bJ-zBKCKR51i5mpUG2yQ/viewform\" target=\"_blank\">https://docs.google.com/forms/d/e/1FAIpQLSf7PGm3oswGzUSd56VVQaVFe7Gmk0bJ-zBKCKR51i5mpUG2yQ/viewform</a></p>\r\n<p><hr></p>\r\n<p>Helllllllo tout le monde. </p>\r\n<p>Un appel à bénévoles est lancé pour dynamiser notre réseau, offrir l\'opportunité d\'acquérir de l\'expérience en tant que bénévole et rencontrer les personnes les plus inspirantes qui soient. </p>\r\n<p>*Ouvert aux alumni et aux non-alumni. </p>\r\n<p>Date limite de candidature : 1er Juillet.</p>\r\n<p>Postuler au lien plus haut.</p>', NULL),
(13, 13, '2023-07-05 00:00:00', 1, 'Alumni Spotlight - Professor Tonjock Rosemary. Fulbright Program', NULL, '<p>Happy Tuesday,<br>It\'s Alumni Spotlight Day people. Are you ready?</p>\r\n<p>Meet Professor Tonjock Rosemary , The Fulbright Program Alumni 2017-2018 at the @University of Florida Gainsville , USA. She is currently an Associate Professor of Mycology and Phytopathology in the Department of Biological Sciences, Faculty of Science in the University of Bamenda, Cameroon.</p>\r\n<p>Rosemary received the Fulbright scholar award for her outstanding research in Mycology and her contributions in the advancement of science and development.&nbsp;<br>She is also and outstanding leader in many high profile academic and professional bodies. She is the Technical and Logistic Secretary in the Cameroon Academy of Young Scientists (CAYS), an Affiliate of the African Academy of Sciences (AAS), an executive committee member of TWAS Young Affiliate Network (TYAN), the coordinator for the western zone for Cameroonian Professional Research Oriented Women (CaPROWN) and a mentor for Higher Institute for Growth in Health Research for (HIGHER) Women Consortium, Cameroon.</p>\r\n<p>Aside being a Fulbright Scholar, Professor Tonjock is equally a fellow of the African Science Leadership Programme (ASLP) cohort 5.0 and an Alexander von Humboldt Experienced research fellow.</p>\r\n<p>She is passionate on mentoring girls and early female career researchers in STEM fields.</p>\r\n<p>Something amazing/surprising about Rosemary is that she says she can see her face &nbsp; without a mirror. Have you ever thought about that? Can You?<br>Thank you Rose for an amazing and dynamic profile for women in STEM and Cameroonians in science. Keep going.</p>\r\n<hr>\r\n<p>Mardi,<br>C\'est la journ&eacute;e Alumni Spotlight. &Ecirc;tes-vous pr&ecirc;ts?</p>\r\n<p>Rencontrez le professeur Tonjock Rosemary, dipl&ocirc;m&eacute; du programme Fulbright 2017-2018 &agrave; l\'Universit&eacute; de Florida-Gainsville au &Eacute;tats-Unis. Elle est actuellement Professeure agr&eacute;g&eacute;e de Mycologie et de Phytopathologie au D&eacute;partement des Sciences Biologiques de la Facult&eacute; des Sciences de l\'Universit&eacute; de Bamenda, au Cameroun.</p>\r\n<p>Rosemary a re&ccedil;u le prix Fulbright pour ses recherches exceptionnelles en mycologie et ses contributions &agrave; l\'avancement de la science et au d&eacute;veloppement.<br>Elle est &eacute;galement une leader exceptionnel dans de nombreux organismes universitaires et professionnels de haut niveau. Elle est secr&eacute;taire technique et logistique &agrave; l\'Acad&eacute;mie Camerounaise des Jeunes Scientifiques (CAYS), affili&eacute;e &agrave; l\'Acad&eacute;mie Africaine des Sciences (AAS), membre du comit&eacute; ex&eacute;cutif de TWAS Young Affiliate Network (TYAN), coordinatrice de la zone ouest pour Femmes Camerounaises Professionnelles Orient&eacute;es vers la Recherche (CaPROWN) et mentor pour le Consortium de l\'Institut Sup&eacute;rieur pour la Croissance de la Recherche en Sant&eacute; pour les Femmes (HIGHER), Cameroun.</p>\r\n<p>En plus d\'&ecirc;tre boursier Fulbright, le professeur Tonjock est &eacute;galement fellow de la cohorte 5.0 du Programme de Leadership Scientifique Africain (ASLP) et Chercheur Exp&eacute;riment&eacute; Alexander von Humboldt.</p>\r\n<p>Elle est passionn&eacute;e par le mentorat des filles et des chercheuses en d&eacute;but de carri&egrave;re dans les domaines STEM.</p>\r\n<p>Quelque chose d\'&eacute;tonnant/surprenant &agrave; propos de Rosemary, c\'est &nbsp;qu\'elle peut voir son visage sans miroir. Avez-vous d&eacute;j&agrave; pens&eacute; &agrave; &ccedil;a? Pouvez-vous?</p>\r\n<p>Merci Rose pour un profil incroyable et dynamique pour les femmes en STEM et les Camerounais en science.</p>', NULL),
(14, 14, NULL, 1, 'Mandela Washington Fellows 2023 updates', NULL, '<p>Team Cameroon of the Mandela Washington Fellowship for Young African Leaders 2023 had the honor of being received in audience by the Minister of Youth and Civic Education accompanied by several members of his cabinet.&nbsp;</p>\r\n<p><img src=\"../../content/library/images/mceu_6814939311688378715276.jpg\" width=\"503\" height=\"335\"></p>\r\n<p>This was just after the special reception at the residence of the US Ambassador to Cameroon.</p>\r\n<p>&nbsp;</p>', NULL),
(15, 15, NULL, 1, 'Apply for the \'Let Her Speak\' Information Session', NULL, '<p>- Are you a girl aged 15 to 25?<br>- Are you looking for free and certified training to improve your communication skills?<br>- Do you wish to know more about U.S. exchange programs and Study Abroad opportunities for young Cameroonian girls?<br>If your responses are \"YES!\" this opportunity is for you.<br>Apply via the link below no later than July 30, 2023 (Only 30 spots available).<br>https://docs.google.com/.../1FAIpQLSfLOOiM0fQ.../viewform...</p>', NULL),
(16, 16, '2023-07-05 00:00:00', 1, 'Nominate a woman for the \'Women Building Peace Award\'', NULL, '<p>#ExchangeAlumni, do you know a brave woman leading efforts to build peace?<br>Nominate her for the Women Building Peace Award!<br>Learn more and make sure you <strong>submit your nomination by July 31</strong>:<br><a href=\"https://ow.ly/6EOv50OXaTT\">https://ow.ly/6EOv50OXaTT</a>&nbsp;<br>Exchange Programs - U.S. Department of State U.S. Department of State United States Institute of Peace</p>', NULL),
(17, 17, NULL, 1, 'Ambassador Lamora launches the water project implemented by “Comité pour le développement du village Tsinbing (Codevit)', NULL, '<p>Thanks to the Ambassador Special Self Help funding, more than 5,000 people at Tsibing village and its environs will have access to potable water. On June 28, Ambassador Lamora launched the water project implemented by &ldquo;Comit&eacute; pour le d&eacute;veloppement du village Tsinbing (Codevit)&rdquo;.<br>Learn more on Self Help funding at Political and Economic Section&rsquo;s Grants Program &nbsp;https://cm.usembassy.gov/smalls-grants-program/.</p>', NULL),
(18, 18, '2023-07-05 00:00:00', 1, 'Alumni spotlight - Professor Adama Ousmanou. SUSI', NULL, '<p>Hello hello,<br>We are on AlumniSpotlight. We are certain you are thrilled to discover exceptional Alumni and also the programs and opportunities they inspire us through. Let\'s dive right in.<br>Meet Professor Dr Adama Ousmanou, a @SUSI Scholar 2018. Receiving his Award as a result of his teachings and publications on religions, ethnicity and power (in the Chad basin comparatively in Cameroon, Chad and Nigeria) and the relationship between higher education and violent extremism.<br>Prof Adama who is affiliated to the University of Maroua assures the SUSI program enhanced his capability to handle theoretical, conceptual, methodological and epistemological challenges in analysing issues related to religions, race, ethnicity, power and social balance. He says the fact that different religions in the US cohabit pacifically together has him working on solutions to implement similar models of Dialogue in Cameroon.<br>Thank Prof Adama for your tenacity and focus.<br>**********<br>Aujourd\'hui c\'est la journ&eacute;e #AlumniSpotlight. D&eacute;couvrons des Alumni exceptionnels ainsi que les programmes et les opportunit&eacute;s.<br>Rencontrez le professeur Dr Adama Ousmanou, Alumni @SUSI 2018. son Award &agrave; &eacute;t&eacute; re&ccedil;u &agrave; la suite de ses enseignements et publications sur les religions, l\'ethnicit&eacute; et le pouvoir (dans le bassin du Tchad comparativement au Cameroun, au Tchad et au Nigeria) et aussi a ses publications sur la relation entre l\'enseignement sup&eacute;rieur et la violence extr&eacute;misme.<br>Le professeur Adama qui est affili&eacute; &agrave; l\'Universit&eacute; de Maroua: assure que le programme SUSI a am&eacute;lior&eacute; sa capacit&eacute; &agrave; g&eacute;rer les d&eacute;fis th&eacute;oriques, conceptuels, m&eacute;thodologiques et &eacute;pist&eacute;mologiques dans l\'analyse des questions li&eacute;es aux religions, &agrave; la race, &agrave; l\'ethnicit&eacute;, au pouvoir et &agrave; l\'&eacute;quilibre social. Il constate le fait que diff&eacute;rentes religions aux &Eacute;tats-Unis cohabitent pacifiquement l\'am&egrave;ne &agrave; travailler sur des solutions pour mettre en &oelig;uvre des mod&egrave;les similaires de dialogue au Cameroun.<br>Merci au professeur Adama pour votre t&eacute;nacit&eacute;.</p>', NULL),
(19, 20, NULL, 1, 'Alumni Impact. Sophie Ngassa, Panelist for women in Tech Week', NULL, '<p>Sophie, a digital rights advocate and World Pulse Ambassador, was a featured panelist in a conversation on women influencers in technology. In her session, Sophie and other technology leaders spoke about the rise of women leaders in technology, and how women can contribute to measurable and meaningful change in their fields. #twimpact</p>', NULL),
(20, 21, NULL, 1, 'Recap of Alumni Spotlight May/June', NULL, '<p>Published by Djemi Njiki Michele &nbsp; &middot; &nbsp; &middot;&nbsp;<br>&nbsp;<br>We are doing a recap of the amazing Alumni that featured on our Alumni spotlight for the months of May and June.<br>We hope their profiles, their work in community, academia and public spheres were an inspiring moment and that you were enlightened discovering the U.S. Exchange Programs they benefitted from.<br>Cheers to them and we encourage them on their trailblazing journeys.<br>**********<br>Nous faisons un r&eacute;capitulatif des incroyables Alumni qui ont figur&eacute; sur notre Alumni spotlight pendant les mois de Mai et Juin.<br>Nous esp&eacute;rons que leurs profils, leur travail dans la communaut&eacute;, le milieu universitaire et les sph&egrave;res publiques ont &eacute;t&eacute; un moment inspirant et que vous avez &eacute;t&eacute; &eacute;clair&eacute; en d&eacute;couvrant les programmes d\'&eacute;change Am&eacute;ricains dont ils ont b&eacute;n&eacute;fici&eacute;.<br>Bravo &agrave; eux et nous les encourageons dans leurs parcours.<br>NNANE NTUBE Official, Alumni of YALI Regional Leadership Center West Africa<br>Nkembeteck Henry Nkwa, Alumni of Mandela Washington Fellowship for Young African Leaders<br>Janet Bih, Alumni of the TechWomen Program<br>Nouhou Bello, Alumni of the International Visitor Leadership Program (IVLP)<br>Josiane Sylvie Mbakop, Alumni of AWEP Cameroon<br>Rudolf N. Nsang, Alumni of the Community Solutions Program<br>Tonjock Rosemary, Alumni of the Fulbright Educational Exchange Program<br>Adama Ousmanou, Alumni of Study of the U.S. Institutes</p>', NULL),
(21, 23, NULL, 1, 'RLC Alumni Are having the RLC Tour soon. Register Now', NULL, '<p>Salut Chers jeunes de la ville de Maroua!<br>Tous vos chemins doivent mener au CPFF de Maroua ce samedi 08 juillet alors que le YALI West Africa Alumni Association Cameroon ou l\'Association des Alumni du YALI Afrique de l\'Ouest au Cameroun est sur le point de passer le week-end avec vous.<br>Un moment pour les YALIENS de se former, partager leurs exp&eacute;riences, exposer ce qu\'ils font/produisent, r&eacute;seauter et encadrer les plus jeunes sur les programmes YALI et ses grandes opportunit&eacute;s.<br>#YALIWEEKEND237<br>Inscrivez-vous via le lien ci-dessous et faites partir de cette belle exp&eacute;rience.<br><a href=\"https://docs.google.com/.../1FAIpQLSd1uaDvQ8ykp1.../viewform\">https://docs.google.com/.../1FAIpQLSd1uaDvQ8ykp1.../viewform</a></p>\r\n<p>******</p>\r\n<p><br>Hello great youth of Maroua city. All roads lead to CPFF Maroua this Saturday 08th July as YALI West Africa Alumni Association Cameroon is set to spend the weekend with youth in the City.<br>A time for YALIANS to train, share their experiences, exhibit things they do /produce, network and mentor younger ones about YALI programs and its great opportunities.<br>#YALIWEEKEND237<br>Register through the link below and be part of this beautiful experience.<br><a href=\"https://docs.google.com/.../1FAIpQLSd1uaDvQ8ykp1.../viewform\">https://docs.google.com/.../1FAIpQLSd1uaDvQ8ykp1.../viewform</a>&nbsp;</p>', NULL),
(22, 25, NULL, 1, 'Quick tips for non-Alumni', NULL, '<p>We have put together a few tips for non-alumni. The general idea is to have you informed on the different exchange programs you can apply for, give you the opportunity to volunteer with us to gain experience in any field relevant to you and have the chance of meeting a mentor from the Alumni Network.<br>So here we go:<br>1. Follow us on social media. You will get to discover Alumni from spotlights and activities, you will also discover the various exchange programs.<br>2. Follow the @U.S. Embassy Yaounde on social media to discover the programs, when they are launched and get valuable insights on application requirements.<br>3. Attend networking events as much as you can. These will put you in contact with alumnus and increase you chances of getting a mentor in your field of interest.<br>4. Volunteer on projects of the Network or of Alumni. It is a great way to gain experience and develop your community.<br>5. Apply for Exchange Programs of the U.S. Department of State. If you follow the above steps, you will be able to identify which programs correspond best to your professional goals and abilities and have the opportunity to be a fellow in one of the 19 programs currently offered.</p>\r\n<p><br>**********</p>\r\n<p><br>Aujourd\'hui, nous avons rassembl&eacute; quelques conseils pour les non-alumni. L\'id&eacute;e g&eacute;n&eacute;rale est de vous informer sur les diff&eacute;rents programmes d\'&eacute;change auxquels vous pouvez postuler, de vous donner la possibilit&eacute; de faire du b&eacute;n&eacute;volat avec nous pour acqu&eacute;rir de l\'exp&eacute;rience dans n\'importe quel domaine qui vous concerne et d\'avoir la chance de rencontrer un mentor du r&eacute;seau des anciens boursiers (Alumni).<br>Alors on y va :<br>1. Suivez-nous sur les r&eacute;seaux sociaux. Vous d&eacute;couvrirez les Alumni &agrave; partir de spotlights et d\'activit&eacute;s, vous d&eacute;couvrirez &eacute;galement les diff&eacute;rents programmes d\'&eacute;changes.<br>2. Suivez @U.S. Embassy Yaounde sur les r&eacute;seaux sociaux pour d&eacute;couvrir les programmes, quand ils sont lanc&eacute;s et obtenir des informations pr&eacute;cieuses sur les exigences de candidature.<br>3. Assistez aux &eacute;v&eacute;nements de r&eacute;seautage autant que vous le pouvez. Ceux-ci vous mettront en contact avec d\'anciens &eacute;l&egrave;ves et augmenteront vos chances d\'obtenir un mentor dans votre domaine d\'int&eacute;r&ecirc;t.<br>4. Proposer vous comme b&eacute;n&eacute;vole sur des projets du R&eacute;seau ou des Alumni. C\'est un excellent moyen d\'acqu&eacute;rir de l\'exp&eacute;rience et de d&eacute;velopper votre communaut&eacute;.<br>5. Postulez aux programmes d\'&eacute;change du D&eacute;partement d\'&Eacute;tat am&eacute;ricain. Si vous suivez les &eacute;tapes ci-dessus, vous serez en mesure d\'identifier les programmes qui correspondent le mieux &agrave; vos objectifs et capacit&eacute;s professionnels et aurez la possibilit&eacute; d\'&ecirc;tre boursier dans l\'un des 19 programmes actuellement offerts.</p>', NULL),
(23, 26, '2023-07-05 00:00:00', 1, 'Alumni Spotlight - Britney Berinyu Moukoko. TechGirls Program', NULL, '<p>Are you excited to discover our Alumni of the week?</p>\r\n<p><br>Meet Britney Berinyu Moukoko, TechGirls Alumni 2022.<br>Britney is a student, recipient of the Tech Girls Award for the fantastic work she does within her community training girls in a domain she is passionate about, Tech.<br>She has trained over 100 young girls with tech skills through Tech boot camps and trained over 80 girls in hand-work and self sustaining entrepreneurial skills. She has equally organised back to school campaigns for internally displaced underprivileged children where over 20 children were funded. She is the pioneer of the Book Aid International&rsquo;s Book Fund and through this program, over 2000 books were donated to internally displaced children and teens in the Southwest Region of Cameroon to promote reading and writing skills.<br>A major update about Britney is that she is currently working on sponsoring 100 internally displaced children to School by September.<br>Something amazing her, she is right handed and left handed. Pretty cool right.<br>Need we say, it is inspiring to see young people like Britney use their passion to build communities and people. Cheers to you and good luck in your endeavours. To many more wins.</p>\r\n<p><br>**********</p>\r\n<p>&nbsp;Avez-vous h&acirc;te de d&eacute;couvrir notre Alumni de la semaine ?<br>Rencontrez Britney Berinyu Moukoko, du programme Techgirls 2022.<br>Britney est &eacute;tudiante et &agrave; r&eacute;&ccedil;u la bourse du programme Tech Girls Award grace au travail fantastique qu\'elle fait au sein de sa communaut&eacute;; formant des filles dans un domaine qui la passionne, la Tech.<br>Elle a form&eacute; plus de 100 jeunes filles aux comp&eacute;tences techniques dans le cadre de camps technologiques et form&eacute; plus de 80 filles au travail manuel et aux comp&eacute;tences entrepreneuriales autonomes. Elle a &eacute;galement organis&eacute; des campagnes de \'retour &agrave; l\'&eacute;cole\' pour les enfants d&eacute;favoris&eacute;s d&eacute;plac&eacute;s internes o&ugrave; plus de 20 enfants ont &eacute;t&eacute; financ&eacute;s. Elle est la pionni&egrave;re du Book Aid International&rsquo;s Book Fund et gr&acirc;ce &agrave; ce programme, plus de 2000 livres ont &eacute;t&eacute; donn&eacute;s &agrave; des enfants et adolescents d&eacute;plac&eacute;s dans la r&eacute;gion du sud-ouest du Cameroun pour promouvoir les comp&eacute;tences en lecture et en &eacute;criture.<br>Une mise &agrave; jour majeure &agrave; propos de Britney est qu\'elle travaille actuellement &agrave; parrainer 100 enfants d&eacute;plac&eacute;s internes &agrave; l\'&eacute;cole d\'ici Septembre.<br>Quelque chose d\'&eacute;tonnant, elle est ambidextre. Assez cool.<br>C\'est inspirant de voir des jeunes comme Britney utiliser leur passion pour b&acirc;tir des communaut&eacute;s et des personnes. Bravo &agrave; vous et bonne chance dans vos d&eacute;marches. A bien d\'autres victoires.</p>', NULL),
(24, 27, NULL, 1, 'Applications for USEPANC volunteers closed', NULL, '<p>Hello all,<br>We appreciate the time you took to apply and your applications have been received, over 180 applications. We look forward to reviewing them and you will be notified by August only if you have been selected.<br>Thank you once for your interest and dedication.<br>USEPANC</p>\r\n<p><br>********</p>\r\n<p><br>Bonjour &agrave; tous,<br>Nous appr&eacute;cions le temps que vous avez pris pour postuler et vos candidatures ont &eacute;t&eacute; re&ccedil;ues, plus de 180. Nous sommes impatients de les examiner et vous serez notifi&eacute;s au mois d\'ao&ucirc;t uniquement si vous avez &eacute;t&eacute; s&eacute;lectionn&eacute;.<br>Merci une fois pour votre int&eacute;r&ecirc;t et votre d&eacute;vouement.<br>USEPANC</p>', NULL),
(25, 28, '2023-07-19 00:00:00', 1, 'In Loving Memory of  His Majesty Bakary Bouba, Lamido of Maroua, IVLP Alumni', NULL, '<p>It is with great sadness that we announce the passing of an illustrious figure, His Majesty Bakari Bouba. He was the Lamido of Maroua and an alumnus of the International Visitor Leadership Program (IVLP). We will like to express our deepest condolences to his family, friends, the people of the Far North and the IVLP community during this time. May Allah grant him mercy and may the land of our ancestors have him rest in peace.<br>***********<br>C\'est avec grande tristesse que nous annon&ccedil;ons le d&eacute;c&egrave;s d\'une illustre figure, Sa Majest&eacute; Bakari Bouba. Il &eacute;tait le Lamido de Maroua et Alumni de l\'International Visitor Leadership Program (IVLP). Nous voudrions exprimer nos plus sinc&egrave;res condol&eacute;ances &agrave; sa famille, ses amis, le peuple de l\'extreme Nord et la communaut&eacute; IVLP pendant cette p&eacute;riode. Qu\'Allah lui accorde sa mis&eacute;ricorde et que la terre de nos anc&ecirc;tres lui soit leg&egrave;re.</p>', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int UNSIGNED NOT NULL,
  `category_id` int DEFAULT NULL,
  `parent` int UNSIGNED DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `layout` int DEFAULT '1',
  `template` int DEFAULT NULL,
  `controller` varchar(50) DEFAULT 'standard',
  `link` varchar(150) DEFAULT NULL,
  `image` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `category_id`, `parent`, `is_active`, `layout`, `template`, `controller`, `link`, `image`) VALUES
(1, NULL, NULL, 1, 5, NULL, 'standard', '', NULL),
(2, NULL, NULL, 1, 1, NULL, 'standard', 'about', 'page-about-image-1679305057.jpg'),
(3, NULL, NULL, 1, 1, 2, 'standard', 'contact', NULL),
(4, NULL, NULL, 1, 4, NULL, 'variable_data', 'programs', NULL),
(5, NULL, NULL, 1, 4, NULL, 'variable_data', 'activities', NULL),
(6, NULL, NULL, 1, 4, NULL, 'variable_data', 'news', NULL),
(7, NULL, NULL, 1, 1, NULL, 'standard', 'apply', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `page_categories`
--

CREATE TABLE `page_categories` (
  `id` int NOT NULL,
  `link` varchar(50) NOT NULL,
  `image` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `page_category_content`
--

CREATE TABLE `page_category_content` (
  `id` int NOT NULL,
  `category_id` int NOT NULL,
  `lang_id` int DEFAULT NULL,
  `title` varchar(300) NOT NULL,
  `description` text,
  `content` text,
  `image_caption` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `page_content`
--

CREATE TABLE `page_content` (
  `id` int UNSIGNED NOT NULL,
  `lang_id` int UNSIGNED DEFAULT '1',
  `page_id` int UNSIGNED DEFAULT NULL,
  `nav_title` varchar(300) DEFAULT NULL,
  `title` varchar(300) DEFAULT NULL,
  `description` mediumtext,
  `content` mediumtext,
  `image_caption` text,
  `last_update` varchar(150) DEFAULT NULL,
  `last_update_by` int UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `page_content`
--

INSERT INTO `page_content` (`id`, `lang_id`, `page_id`, `nav_title`, `title`, `description`, `content`, `image_caption`, `last_update`, `last_update_by`) VALUES
(1, 1, 1, NULL, 'Welcome', NULL, NULL, NULL, NULL, NULL),
(2, 1, 2, NULL, 'About the USG Alumni Association', 'The USG Alumni Association Cameroon is an association of alumni of all US Exchange Programs across the country who have come together to harness efforts for a more significant impact', '<p>The USG Alumni Association Cameroon is an association of alumni of all US Exchange Programs across the country who have come together to harness efforts for a more significant impact</p>', NULL, '2023-03-30', NULL),
(3, 1, 3, NULL, 'Contact', NULL, NULL, NULL, NULL, NULL),
(4, 1, 4, NULL, 'Programs', NULL, '{{{feature =>Program}}}', NULL, NULL, NULL),
(5, 1, 5, NULL, 'Activities', NULL, '{{{feature =>Event}}}', NULL, NULL, NULL),
(6, 1, 6, NULL, 'News', NULL, '{{{feature =>News}}}', NULL, '2023-03-20', NULL),
(7, 1, 7, NULL, 'Apply to attend The Cameroon Alumni National symposium', NULL, NULL, NULL, '2023-03-23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `partners`
--

CREATE TABLE `partners` (
  `id` int UNSIGNED NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `priority` int UNSIGNED DEFAULT NULL,
  `link` varchar(150) DEFAULT NULL,
  `image` varchar(150) DEFAULT NULL,
  `url` mediumtext,
  `title` varchar(150) DEFAULT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `partners`
--

INSERT INTO `partners` (`id`, `is_active`, `priority`, `link`, `image`, `url`, `title`, `description`) VALUES
(1, 1, NULL, 'u-s--embassy-yaounde', 'partner-u-s--embassy-yaou1680167830.png', 'https://cm.usembassy.gov', 'U.S. Embassy Yaoundé', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `poems`
--

CREATE TABLE `poems` (
  `id` int UNSIGNED NOT NULL,
  `category_id` int UNSIGNED DEFAULT NULL,
  `author` int UNSIGNED DEFAULT '1',
  `is_active` tinyint(1) DEFAULT '1',
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `link` varchar(150) DEFAULT NULL,
  `image` varchar(150) DEFAULT NULL,
  `image_share` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `poem_categories`
--

CREATE TABLE `poem_categories` (
  `id` int UNSIGNED NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `link` varchar(150) DEFAULT NULL,
  `image` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `poem_category_content`
--

CREATE TABLE `poem_category_content` (
  `id` int NOT NULL,
  `lang_id` int UNSIGNED DEFAULT '1',
  `category_id` int UNSIGNED DEFAULT NULL,
  `title` varchar(256) DEFAULT NULL,
  `description` text,
  `image_caption` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `poem_content`
--

CREATE TABLE `poem_content` (
  `id` int NOT NULL,
  `poem_id` int UNSIGNED DEFAULT NULL,
  `lang_id` int DEFAULT '1',
  `last_update` varchar(150) DEFAULT NULL,
  `last_update_by` int UNSIGNED DEFAULT NULL,
  `title` varchar(300) DEFAULT NULL,
  `description` mediumtext,
  `content` text,
  `image_caption` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `programs`
--

CREATE TABLE `programs` (
  `id` int NOT NULL,
  `link` varchar(50) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `icon` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `programs`
--

INSERT INTO `programs` (`id`, `link`, `image`, `icon`) VALUES
(1, 'mandela-washington-fellowship', 'partner-mwf-cameroon-imag1679484415.png', NULL),
(2, 'the-fulbright-teaching-excellence-achievement-prog', 'partner-cameroon-fulbrigh1679484532.png', NULL),
(3, 'cci', 'partner-cci-image-1679484987.png', NULL),
(4, 'fullbright', 'partner-fullbright-image-1679484998.png', NULL),
(5, 'hubert-h-humphery-fellowship', 'partner-hubert-h-humphery1679485019.png', NULL),
(6, 'yali-wa-alumni-association--cameroon', 'partner-yali-wa-alumni-as1679485040.png', NULL),
(7, 'awep-cameroon', 'partner-awep-cameroon-ima1679485054.png', NULL),
(8, 'study-of-the-us-institutes', 'partner-study-of-the-us-i1679485076.png', NULL),
(9, 'techwomen', 'partner-techwomen-image-1679485084.png', NULL),
(10, 'youth-exchange-and-study', 'partner-youth-exchange-an1679485096.png', NULL),
(11, 'ivlp', 'program-ivlp-image-1687938265.png', NULL),
(12, 'community-engagement-exchange-program', 'program-community-engagem1687938980.png', NULL),
(13, 'community-solutions', 'program-community-solutio1687939001.png', NULL),
(14, 'international-writing-program', 'program-international-wri1687939566.png', NULL),
(15, 'pan-africa-youth-leadership-program', 'program-pan-africa-youth-1687939588.png', NULL),
(16, 'online-professional-english-network', 'program-online-profession1687939608.png', NULL),
(17, 'english-access-microscholarship-program', 'program-english-access-mi1687939644.png', NULL),
(18, 'tech-girls', 'program-tech-girls-image-1687939680.png', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `program_content`
--

CREATE TABLE `program_content` (
  `id` int NOT NULL,
  `program_id` int NOT NULL,
  `lang_id` int DEFAULT NULL,
  `title` varchar(300) NOT NULL,
  `description` mediumtext,
  `content` text,
  `image_caption` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `program_content`
--

INSERT INTO `program_content` (`id`, `program_id`, `lang_id`, `title`, `description`, `content`, `image_caption`) VALUES
(1, 1, 1, 'Mandela Washington Fellowship', NULL, 'The Mandela Washington Fellowship for Young African Leaders, begun in 2014, is the flagship program of the Young African Leaders Initiative (YALI) that empowers young people through academic coursework, leadership training, and networking. In 2019, the Fellowship will provide 700 outstanding young leaders from Sub-Saharan Africa with the opportunity to hone their skills at a U.S. college or university with support for professional development after they return home.', NULL),
(2, 2, 1, 'The Fulbright Teaching Excellence Achievement Program', NULL, '<p>It is a program sponsored by the U.S. Department of State with funding provided by the U.S. Government and administered by the International Research and Exchanges (IREX) Board. The program brings outstanding international secondary school teachers to the United States to further develop their expertise in their subject areas and enhance their teaching skills. The program consists of a six-to-seven-week customized academic program including seminars on teaching methodologies, curriculum development, instructional technology, inclusive education, and educational leadership.</p>\r\n<p>During the Fulbright TEA fellowship program, participants work closely with U.S. teachers in a secondary or high school and classroom. Upon completion of the program, the participants return to their countries and are expected to share the experience and knowledge gained from the program with their students, colleagues, and other community members.</p>', NULL),
(3, 3, 1, 'CCI', NULL, NULL, NULL),
(4, 4, 1, 'Fullbright', NULL, NULL, NULL),
(5, 5, 1, 'Hubert H Humphery Fellowship', NULL, NULL, NULL),
(6, 6, 1, 'YALI WA Alumni Association, Cameroon', NULL, NULL, NULL),
(7, 7, 1, 'AWEP Cameroon', NULL, NULL, NULL),
(8, 8, 1, 'Study of the US Institutes', NULL, NULL, NULL),
(9, 9, 1, 'Techwomen', NULL, NULL, NULL),
(10, 10, 1, 'Youth Exchange and Study', NULL, NULL, NULL),
(11, 11, 1, 'IVLP', NULL, NULL, NULL),
(12, 12, 1, 'Community Engagement Exchange Program', NULL, NULL, NULL),
(13, 13, 1, 'Community Solutions', NULL, NULL, NULL),
(14, 14, 1, 'International Writing Program', NULL, NULL, NULL),
(15, 15, 1, 'Pan Africa Youth Leadership Program', NULL, NULL, NULL),
(16, 16, 1, 'Online Professional English Network', NULL, NULL, NULL),
(17, 17, 1, 'English Access Microscholarship Program', NULL, NULL, NULL),
(18, 18, 1, 'Tech Girls', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `cycle` varchar(50) DEFAULT NULL,
  `link` varchar(50) NOT NULL,
  `image` varchar(50) DEFAULT NULL,
  `video` text,
  `location` varchar(300) DEFAULT NULL,
  `date_from` datetime DEFAULT NULL,
  `date_to` datetime DEFAULT NULL,
  `impact` int DEFAULT NULL,
  `funding` int DEFAULT NULL,
  `communities` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `project_content`
--

CREATE TABLE `project_content` (
  `id` int NOT NULL,
  `project_id` int NOT NULL,
  `lang_id` int DEFAULT NULL,
  `title` varchar(300) NOT NULL,
  `description` mediumtext,
  `content` text,
  `image_caption` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `site_options`
--

CREATE TABLE `site_options` (
  `id` int NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `image` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `site_options`
--

INSERT INTO `site_options` (`id`, `name`, `image`) VALUES
(1, 'ORG_ACRONYM', NULL),
(2, 'ORG_TITLE', NULL),
(3, 'ORG_DESCRIPTION', NULL),
(4, 'ORG_TAG', NULL),
(5, 'ORG_LOGO', 'logo.png'),
(6, 'ORG_ADDRESS', NULL),
(7, 'ORG_EMAIL', NULL),
(8, 'ORG_NUMBER', NULL),
(9, 'DOMAIN', NULL),
(10, 'THEME', NULL),
(11, 'ORG_VISION', NULL),
(12, 'ORG_ICON', 'favicon.png'),
(13, 'ORG_DEFAULT_IMAGE', 'option--image-1679483821.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `site_options_content`
--

CREATE TABLE `site_options_content` (
  `id` int NOT NULL,
  `option_id` int DEFAULT NULL,
  `lang_id` int DEFAULT '1',
  `title` varchar(300) DEFAULT NULL,
  `description` mediumtext,
  `content` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `site_options_content`
--

INSERT INTO `site_options_content` (`id`, `option_id`, `lang_id`, `title`, `description`, `content`) VALUES
(1, 1, 1, 'Acronym', 'define the acronym for the organisation', 'USGEx'),
(2, 2, 1, 'Name of Organisation', 'Defines the name to be used for the organisation throughout the Website', 'USG Exchange Programs Alumni Cameroon'),
(3, 3, 1, 'Description', 'Defines a brief introduction (Pitch) for your organisation used for Meta Information.', 'The USG Alumni Association Cameroon is an association of alumni of all US Exchange Programs across the country who have come together to harness efforts for a more significant impact'),
(4, 4, 1, 'Tagline', 'Defines the tag line for the organisation', NULL),
(5, 5, 1, 'Organisation\'s Logo', 'Defines the logo for the organisation.', NULL),
(6, 6, 1, 'Organisation\'s Address', 'Defines the Organisation\'s main Physical Address', NULL),
(7, 7, 1, 'Email', 'Defines Organisation\'s main Email address', 'info@usgexchangeprogramscmr.org'),
(8, 8, 1, 'Organisation\'s Phone Number', 'Defines Organisation\'s Primary Phone Number', NULL),
(9, 9, 1, 'Organisation\'s DOMAIN', 'defines Organisation\'s Domain name without http(s)://', 'usgexchangeprogramscmr.org'),
(10, 10, 1, 'Site Theme', 'Defines the Design theme which the site uses', 'bootstrap_child'),
(11, 11, 1, 'Our Vision', NULL, NULL),
(12, 12, 1, 'Favicon', 'Icon displayed on the address bar of browser', NULL),
(13, 13, 1, 'Default Image', 'The default image to display where there\'s none', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `social_networks`
--

CREATE TABLE `social_networks` (
  `id` int NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `link` varchar(100) DEFAULT NULL,
  `title` varchar(150) DEFAULT NULL,
  `url` varchar(300) DEFAULT NULL,
  `icon` varchar(150) DEFAULT 'far fa-share-square',
  `image` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `social_networks`
--

INSERT INTO `social_networks` (`id`, `is_active`, `link`, `title`, `url`, `icon`, `image`) VALUES
(1, 1, 'facebook', 'Facebook', 'https://facebook.com', 'fab fa-facebook', NULL),
(2, 1, 'twitter', 'Twitter', 'https://twitter.com', 'fab fa-twitter', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `spotlight`
--

CREATE TABLE `spotlight` (
  `id` int NOT NULL,
  `link` varchar(150) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `spotlight_content`
--

CREATE TABLE `spotlight_content` (
  `id` int NOT NULL,
  `spotlight_id` int NOT NULL,
  `lang_id` int DEFAULT '1',
  `title` varchar(150) NOT NULL,
  `description` mediumtext,
  `image_caption` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stories`
--

CREATE TABLE `stories` (
  `id` int NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `link` varchar(50) NOT NULL,
  `image` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `story_content`
--

CREATE TABLE `story_content` (
  `id` int NOT NULL,
  `story_id` int NOT NULL,
  `lang_id` int DEFAULT NULL,
  `title` varchar(300) NOT NULL,
  `description` mediumtext,
  `content` text,
  `image_caption` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `id` int UNSIGNED NOT NULL,
  `category_id` int UNSIGNED DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `location_id` int DEFAULT NULL,
  `link` varchar(150) DEFAULT NULL,
  `first_name` varchar(300) DEFAULT NULL,
  `last_name` varchar(300) DEFAULT NULL,
  `image` varchar(150) DEFAULT NULL,
  `from_date` datetime DEFAULT NULL,
  `to_date` datetime DEFAULT NULL,
  `facebook` longtext,
  `twitter` longtext,
  `youtube` longtext,
  `linkedin` longtext,
  `email` longtext,
  `website` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`id`, `category_id`, `is_active`, `location_id`, `link`, `first_name`, `last_name`, `image`, `from_date`, `to_date`, `facebook`, `twitter`, `youtube`, `linkedin`, `email`, `website`) VALUES
(1, 2, 1, NULL, NULL, 'Desmond', 'Ngala', 'team--image-1679569487.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 2, 1, NULL, NULL, 'Prof. Marceline', 'Djuidje Ngounoue, Ph.D', 'team--image-1679644021.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 2, 1, NULL, NULL, 'Prof. Tonjock Rosemary', 'Kinge', 'team--image-1679644076.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 2, 1, NULL, NULL, 'Ferdinant M.', 'Sonyuy', 'team--image-1679644410.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 2, 1, NULL, NULL, 'Ngenang Cheyip', 'Kulu', 'team--image-1679644461.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 2, 1, NULL, NULL, 'Ines', 'Tchakounte Yimga', 'team--image-1679644506.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 2, 1, NULL, NULL, 'Nelly-Shella', 'T. Yonga', 'team--image-1679648450.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 2, 1, NULL, NULL, 'Joseph', 'Bainamndi Daliwa', 'team--image-1679648489.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 2, 1, NULL, NULL, 'Joseph', 'Lambe Yonkam', 'team--image-1679648518.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `team_categories`
--

CREATE TABLE `team_categories` (
  `id` int UNSIGNED NOT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `link` varchar(150) DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `team_categories`
--

INSERT INTO `team_categories` (`id`, `is_active`, `link`, `image`) VALUES
(1, 1, 'first-edition', NULL),
(2, 1, 'second-edition', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `team_category_content`
--

CREATE TABLE `team_category_content` (
  `id` int NOT NULL,
  `category_id` int UNSIGNED DEFAULT NULL,
  `lang_id` int DEFAULT '1',
  `title` varchar(300) DEFAULT NULL,
  `description` text,
  `image_caption` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `team_category_content`
--

INSERT INTO `team_category_content` (`id`, `category_id`, `lang_id`, `title`, `description`, `image_caption`) VALUES
(1, 1, 1, 'First Edition', NULL, NULL),
(2, 2, 1, 'Second Edition', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `team_content`
--

CREATE TABLE `team_content` (
  `id` int UNSIGNED NOT NULL,
  `team_id` int UNSIGNED NOT NULL,
  `lang_id` int UNSIGNED NOT NULL,
  `position` mediumtext,
  `profile` text,
  `image_caption` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `team_content`
--

INSERT INTO `team_content` (`id`, `team_id`, `lang_id`, `position`, `profile`, `image_caption`) VALUES
(1, 1, 1, NULL, '- Profession: Project Manager \r\n- Exchange Program and Year of Participation: IVLP-GMIT 2021\r\n- Project Committee/Subcommittee: Scientific Committee', NULL),
(2, 2, 1, NULL, '<p>Prof. Marceline Djuidje Ngounoue, Ph.D. is an Associate Professor of Biochemistry, Molecular Biology and Immunology & Coordinator of Research Ethics Committee at the University of YaoundÃ© 1, Cameroon. Fulbright Scholar Alumna/Former Visiting Professor at Yale University School of Medicine, New Haven, CT, USA. Fellow of the Cameroon Academy of Young Scientists (CAYS). Member of the African Consortium of Bioethicists. Holistic mentor for women and girls in science. Deputy Chair of the USG Umbrella Alumni Board. Chair of the Scientific Committee</p>', NULL),
(3, 3, 1, NULL, '<p>Associate Professor of Mycology and Phytopathology, University of Bamenda. Technical and Logistic Secretary of the Cameroon Academy of Young Scientists. Fulbright Scholar Alumni 2018. Alexander on Humboldt Experienced Researcher Alumni 2022. Subcommittee: Scientific Committee</p>', NULL),
(4, 4, 1, NULL, NULL, NULL),
(5, 5, 1, NULL, '- Profession: Paralegal/MARCOM/Human Right\r\n- Exchange Program and Year of Participation: YALI RLC Accra-Ghana cohort 11\r\n- Project Committee: Assist Project Lead/Subcommittee: Communication.', NULL),
(6, 6, 1, NULL, 'Profession: Project Manager\r\nProgam and year: MWF 2022\r\nCommittee: Project supervision/Logistics', NULL),
(7, 7, 1, NULL, '- Profession: Humanitarian Worker \r\n- Exchange Program and Year of Participation: Mandela Washington Fellowship - 2015\r\n- Project Committee/Subcommittee:  Technical Adviser', NULL),
(8, 8, 1, NULL, '- Profession: Researcher/Executive Director\r\n- Exchange Program and Year of Participation: MWF /2017 and Fulbright /2020\r\n- Project Committee/Subcommittee:  General Supervision /Scientific Committee', NULL),
(9, 9, 1, NULL, 'Profession: Project Officer\r\nExchange Program and Year: K-L YES 2012-2013\r\nCommittee: Secretariat', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `test_features`
--

CREATE TABLE `test_features` (
  `id` int NOT NULL,
  `category_id` int DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `name` varchar(50) NOT NULL,
  `link` varchar(50) NOT NULL,
  `image` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `test_feature_categories`
--

CREATE TABLE `test_feature_categories` (
  `id` int NOT NULL,
  `link` varchar(50) NOT NULL,
  `image` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `test_feature_category_content`
--

CREATE TABLE `test_feature_category_content` (
  `id` int NOT NULL,
  `category_id` int NOT NULL,
  `lang_id` int DEFAULT NULL,
  `title` varchar(300) NOT NULL,
  `description` text,
  `content` text,
  `image_caption` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `test_feature_content`
--

CREATE TABLE `test_feature_content` (
  `id` int NOT NULL,
  `test_feature_id` int DEFAULT NULL,
  `lang_id` int DEFAULT NULL,
  `title` varchar(300) NOT NULL,
  `description` mediumtext,
  `content` text,
  `image_caption` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `themes`
--

CREATE TABLE `themes` (
  `id` int NOT NULL,
  `link` varchar(32) DEFAULT NULL,
  `image` varchar(32) DEFAULT NULL,
  `title` varchar(300) NOT NULL,
  `description` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `themes`
--

INSERT INTO `themes` (`id`, `link`, `image`, `title`, `description`) VALUES
(1, NULL, NULL, 'Default', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `theme_layouts`
--

CREATE TABLE `theme_layouts` (
  `id` int NOT NULL,
  `theme_id` int DEFAULT NULL,
  `link` varchar(32) DEFAULT NULL,
  `image` varchar(32) DEFAULT NULL,
  `title` varchar(300) NOT NULL,
  `description` text,
  `filename` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `theme_layouts`
--

INSERT INTO `theme_layouts` (`id`, `theme_id`, `link`, `image`, `title`, `description`, `filename`) VALUES
(1, 1, NULL, NULL, 'Default', NULL, 'default.php'),
(2, 1, NULL, NULL, 'Full Page', NULL, 'full-page.php'),
(3, 1, NULL, NULL, 'Blank Page', NULL, 'blank-page.php'),
(4, NULL, NULL, NULL, 'Variable Data', NULL, 'variable-data.php'),
(5, 1, 'home', NULL, 'Homepage', NULL, 'home.php');

-- --------------------------------------------------------

--
-- Table structure for table `theme_templates`
--

CREATE TABLE `theme_templates` (
  `id` int NOT NULL,
  `theme_id` int DEFAULT NULL,
  `link` varchar(32) DEFAULT NULL,
  `image` varchar(32) DEFAULT NULL,
  `title` varchar(300) NOT NULL,
  `description` text,
  `filename` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `theme_templates`
--

INSERT INTO `theme_templates` (`id`, `theme_id`, `link`, `image`, `title`, `description`, `filename`) VALUES
(1, 1, NULL, NULL, 'Default', NULL, 'default.html'),
(2, 1, NULL, NULL, 'Contact', NULL, 'contact.html');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int UNSIGNED NOT NULL,
  `role` int DEFAULT '2',
  `is_active` tinyint(1) DEFAULT '1',
  `username` varchar(150) NOT NULL,
  `email` varchar(150) DEFAULT NULL,
  `hashed_password` varchar(255) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `gender` int DEFAULT NULL,
  `profile` text,
  `image` varchar(255) DEFAULT NULL,
  `dob` datetime DEFAULT NULL,
  `address` text,
  `city` varchar(150) DEFAULT NULL,
  `country` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role`, `is_active`, `username`, `email`, `hashed_password`, `first_name`, `last_name`, `gender`, `profile`, `image`, `dob`, `address`, `city`, `country`) VALUES
(1, 2, NULL, 'trevor@yems.group', 'trevor@yems.group', 'efacc4001e857f7eba4ae781c2932dedf843865e', 'Trevor @ Y\'G', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 2, 1, 'webmaster@usgexchangeprogramscmr.org', 'webmaster@usgexchangeprogramscmr.org', 'ecc4328976ee94822aecd16f00d7dbbd589d3636', 'Admin', 'USGX', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `link` (`link`);

--
-- Indexes for table `blog_category_content`
--
ALTER TABLE `blog_category_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_blog_category_content_to_category_id` (`category_id`);

--
-- Indexes for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `link` (`link`),
  ADD KEY `fk_blog_to_blog_category_id` (`category_id`);

--
-- Indexes for table `blog_post_content`
--
ALTER TABLE `blog_post_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_blog_postid0_idx` (`blog_id`);

--
-- Indexes for table `carousel`
--
ALTER TABLE `carousel`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `link` (`link`),
  ADD KEY `fk_carousel_to_carousel_category` (`category_id`);

--
-- Indexes for table `carousel_categories`
--
ALTER TABLE `carousel_categories`
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `link` (`link`);

--
-- Indexes for table `carousel_category_content`
--
ALTER TABLE `carousel_category_content`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `fk_caroursel_category_content_to_carousel_category` (`category_id`);

--
-- Indexes for table `carousel_content`
--
ALTER TABLE `carousel_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_bannerid0_idx` (`carousel_id`);

--
-- Indexes for table `contact_form_messages`
--
ALTER TABLE `contact_form_messages`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `email_subscriptions`
--
ALTER TABLE `email_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `link` (`link`),
  ADD KEY `fk_event_to_event_category` (`category_id`);

--
-- Indexes for table `event_categories`
--
ALTER TABLE `event_categories`
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `link` (`link`);

--
-- Indexes for table `event_category_content`
--
ALTER TABLE `event_category_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_category_content_to_category` (`category_id`);

--
-- Indexes for table `event_content`
--
ALTER TABLE `event_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_event_content_to_event` (`event_id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_gallery_to_gallery_category` (`album_id`);

--
-- Indexes for table `gallery_albums`
--
ALTER TABLE `gallery_albums`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `link` (`link`);

--
-- Indexes for table `gallery_album_content`
--
ALTER TABLE `gallery_album_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_gallery_album_content_to_gallery_album` (`album_id`);

--
-- Indexes for table `gallery_content`
--
ALTER TABLE `gallery_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_gallery_content_to_gallery` (`gallery_id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `locale` (`locale`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `navs`
--
ALTER TABLE `navs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nav_links`
--
ALTER TABLE `nav_links`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `link` (`link`),
  ADD KEY `fk_nav_link_to_nav_link_parent` (`parent`),
  ADD KEY `fk_nav_link_to_nav` (`nav_id`);

--
-- Indexes for table `nav_link_content`
--
ALTER TABLE `nav_link_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_nav_link_content_to_nav_link` (`nav_link_id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `link` (`link`),
  ADD KEY `fk_news_to_category` (`category_id`),
  ADD KEY `fk_news_author_to_users` (`author`);

--
-- Indexes for table `news_categories`
--
ALTER TABLE `news_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `link` (`link`);

--
-- Indexes for table `news_category_content`
--
ALTER TABLE `news_category_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_news_category_content_to_category` (`category_id`);

--
-- Indexes for table `news_content`
--
ALTER TABLE `news_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_news_content_to_news` (`news_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `link` (`link`),
  ADD KEY `fk_page_to_category` (`category_id`),
  ADD KEY `fk_page_to_template` (`template`),
  ADD KEY `fk_page_to_layout` (`layout`),
  ADD KEY `fk_page_to_parent` (`parent`);

--
-- Indexes for table `page_categories`
--
ALTER TABLE `page_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `link` (`link`);

--
-- Indexes for table `page_category_content`
--
ALTER TABLE `page_category_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_page_category_content_to_category` (`category_id`);

--
-- Indexes for table `page_content`
--
ALTER TABLE `page_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_page_content_to_page` (`page_id`),
  ADD KEY `fk_page_content_author_to_users` (`last_update_by`);

--
-- Indexes for table `partners`
--
ALTER TABLE `partners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `poems`
--
ALTER TABLE `poems`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `link` (`link`),
  ADD KEY `fk_poems_to_category` (`category_id`),
  ADD KEY `fk_poem_author_to_users` (`author`);

--
-- Indexes for table `poem_categories`
--
ALTER TABLE `poem_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `link` (`link`);

--
-- Indexes for table `poem_category_content`
--
ALTER TABLE `poem_category_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_poem_category_content_to_category` (`category_id`);

--
-- Indexes for table `poem_content`
--
ALTER TABLE `poem_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_poem_content_to_poem` (`poem_id`),
  ADD KEY `fk_poem_content_update_to_author` (`last_update_by`);

--
-- Indexes for table `programs`
--
ALTER TABLE `programs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `link` (`link`);

--
-- Indexes for table `program_content`
--
ALTER TABLE `program_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_program_content_to_program` (`program_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `link` (`link`);

--
-- Indexes for table `project_content`
--
ALTER TABLE `project_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_project_content_to_id` (`project_id`);

--
-- Indexes for table `site_options`
--
ALTER TABLE `site_options`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `site_options_content`
--
ALTER TABLE `site_options_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_options_content_to_options` (`option_id`);

--
-- Indexes for table `social_networks`
--
ALTER TABLE `social_networks`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `link` (`link`);

--
-- Indexes for table `spotlight`
--
ALTER TABLE `spotlight`
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `link` (`link`);

--
-- Indexes for table `spotlight_content`
--
ALTER TABLE `spotlight_content`
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `fk_spotlight_content_to_spotlight` (`spotlight_id`);

--
-- Indexes for table `stories`
--
ALTER TABLE `stories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `link` (`link`);

--
-- Indexes for table `story_content`
--
ALTER TABLE `story_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_story_content_to_story` (`story_id`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_team_to_location` (`location_id`),
  ADD KEY `fk_team_to_category` (`category_id`);

--
-- Indexes for table `team_categories`
--
ALTER TABLE `team_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `link` (`link`);

--
-- Indexes for table `team_category_content`
--
ALTER TABLE `team_category_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_team_category_content_to_category` (`category_id`);

--
-- Indexes for table `team_content`
--
ALTER TABLE `team_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_team_content_to_team` (`team_id`);

--
-- Indexes for table `test_features`
--
ALTER TABLE `test_features`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `link` (`link`),
  ADD KEY `fk_test_feature_to_category` (`category_id`);

--
-- Indexes for table `test_feature_categories`
--
ALTER TABLE `test_feature_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `link` (`link`);

--
-- Indexes for table `test_feature_category_content`
--
ALTER TABLE `test_feature_category_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_test_feature_category_content_to_category` (`category_id`);

--
-- Indexes for table `test_feature_content`
--
ALTER TABLE `test_feature_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_test_feature_content_to_test_feature` (`test_feature_id`);

--
-- Indexes for table `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `theme_layouts`
--
ALTER TABLE `theme_layouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_theme_layouts_to_them` (`theme_id`);

--
-- Indexes for table `theme_templates`
--
ALTER TABLE `theme_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_theme_templates_to_thems` (`theme_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_category_content`
--
ALTER TABLE `blog_category_content`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_posts`
--
ALTER TABLE `blog_posts`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_post_content`
--
ALTER TABLE `blog_post_content`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carousel`
--
ALTER TABLE `carousel`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `carousel_categories`
--
ALTER TABLE `carousel_categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `carousel_category_content`
--
ALTER TABLE `carousel_category_content`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `carousel_content`
--
ALTER TABLE `carousel_content`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contact_form_messages`
--
ALTER TABLE `contact_form_messages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `email_subscriptions`
--
ALTER TABLE `email_subscriptions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `event_categories`
--
ALTER TABLE `event_categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event_category_content`
--
ALTER TABLE `event_category_content`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event_content`
--
ALTER TABLE `event_content`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gallery_albums`
--
ALTER TABLE `gallery_albums`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gallery_album_content`
--
ALTER TABLE `gallery_album_content`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gallery_content`
--
ALTER TABLE `gallery_content`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `navs`
--
ALTER TABLE `navs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `nav_links`
--
ALTER TABLE `nav_links`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `nav_link_content`
--
ALTER TABLE `nav_link_content`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `news_categories`
--
ALTER TABLE `news_categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `news_category_content`
--
ALTER TABLE `news_category_content`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `news_content`
--
ALTER TABLE `news_content`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `page_categories`
--
ALTER TABLE `page_categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `page_category_content`
--
ALTER TABLE `page_category_content`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `page_content`
--
ALTER TABLE `page_content`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `partners`
--
ALTER TABLE `partners`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `poems`
--
ALTER TABLE `poems`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `poem_categories`
--
ALTER TABLE `poem_categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `poem_category_content`
--
ALTER TABLE `poem_category_content`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `poem_content`
--
ALTER TABLE `poem_content`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `programs`
--
ALTER TABLE `programs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `program_content`
--
ALTER TABLE `program_content`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `project_content`
--
ALTER TABLE `project_content`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `site_options`
--
ALTER TABLE `site_options`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `site_options_content`
--
ALTER TABLE `site_options_content`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `social_networks`
--
ALTER TABLE `social_networks`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `spotlight`
--
ALTER TABLE `spotlight`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `spotlight_content`
--
ALTER TABLE `spotlight_content`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stories`
--
ALTER TABLE `stories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `story_content`
--
ALTER TABLE `story_content`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `team`
--
ALTER TABLE `team`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `team_categories`
--
ALTER TABLE `team_categories`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `team_category_content`
--
ALTER TABLE `team_category_content`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `team_content`
--
ALTER TABLE `team_content`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `test_features`
--
ALTER TABLE `test_features`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `test_feature_categories`
--
ALTER TABLE `test_feature_categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `test_feature_category_content`
--
ALTER TABLE `test_feature_category_content`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `test_feature_content`
--
ALTER TABLE `test_feature_content`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `themes`
--
ALTER TABLE `themes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `theme_layouts`
--
ALTER TABLE `theme_layouts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `theme_templates`
--
ALTER TABLE `theme_templates`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `blog_category_content`
--
ALTER TABLE `blog_category_content`
  ADD CONSTRAINT `fk_blog_category_content_to_category_id` FOREIGN KEY (`category_id`) REFERENCES `blog_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `blog_posts`
--
ALTER TABLE `blog_posts`
  ADD CONSTRAINT `fk_blog_to_blog_category_id` FOREIGN KEY (`category_id`) REFERENCES `blog_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `blog_post_content`
--
ALTER TABLE `blog_post_content`
  ADD CONSTRAINT `fk_blog_content_to_blog_id` FOREIGN KEY (`blog_id`) REFERENCES `blog_posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `carousel`
--
ALTER TABLE `carousel`
  ADD CONSTRAINT `fk_carousel_to_carousel_category` FOREIGN KEY (`category_id`) REFERENCES `carousel_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `carousel_category_content`
--
ALTER TABLE `carousel_category_content`
  ADD CONSTRAINT `fk_caroursel_category_content_to_carousel_category` FOREIGN KEY (`category_id`) REFERENCES `carousel_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `carousel_content`
--
ALTER TABLE `carousel_content`
  ADD CONSTRAINT `fk_carousel_content_to_carousel` FOREIGN KEY (`carousel_id`) REFERENCES `carousel` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `fk_event_to_event_category` FOREIGN KEY (`category_id`) REFERENCES `event_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `event_category_content`
--
ALTER TABLE `event_category_content`
  ADD CONSTRAINT `fk_category_content_to_category` FOREIGN KEY (`category_id`) REFERENCES `event_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `event_content`
--
ALTER TABLE `event_content`
  ADD CONSTRAINT `fk_event_content_to_event` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `gallery`
--
ALTER TABLE `gallery`
  ADD CONSTRAINT `fk_gallery_to_gallery_category` FOREIGN KEY (`album_id`) REFERENCES `gallery_albums` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `gallery_album_content`
--
ALTER TABLE `gallery_album_content`
  ADD CONSTRAINT `fk_gallery_album_content_to_gallery_album` FOREIGN KEY (`album_id`) REFERENCES `gallery_albums` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `gallery_content`
--
ALTER TABLE `gallery_content`
  ADD CONSTRAINT `fk_gallery_content_to_gallery` FOREIGN KEY (`gallery_id`) REFERENCES `gallery` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `nav_links`
--
ALTER TABLE `nav_links`
  ADD CONSTRAINT `fk_nav_link_to_nav` FOREIGN KEY (`nav_id`) REFERENCES `navs` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_nav_link_to_nav_link_parent` FOREIGN KEY (`parent`) REFERENCES `nav_links` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `nav_link_content`
--
ALTER TABLE `nav_link_content`
  ADD CONSTRAINT `fk_nav_link_content_to_nav_link` FOREIGN KEY (`nav_link_id`) REFERENCES `nav_links` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `fk_news_author_to_users` FOREIGN KEY (`author`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_news_to_category` FOREIGN KEY (`category_id`) REFERENCES `news_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `news_category_content`
--
ALTER TABLE `news_category_content`
  ADD CONSTRAINT `fk_news_category_content_to_category` FOREIGN KEY (`category_id`) REFERENCES `news_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `news_content`
--
ALTER TABLE `news_content`
  ADD CONSTRAINT `fk_news_content_to_news` FOREIGN KEY (`news_id`) REFERENCES `news` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `fk_page_to_category` FOREIGN KEY (`category_id`) REFERENCES `page_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_page_to_layout` FOREIGN KEY (`layout`) REFERENCES `theme_layouts` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_page_to_parent` FOREIGN KEY (`parent`) REFERENCES `pages` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_page_to_template` FOREIGN KEY (`template`) REFERENCES `theme_templates` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `page_category_content`
--
ALTER TABLE `page_category_content`
  ADD CONSTRAINT `fk_page_category_content_to_category` FOREIGN KEY (`category_id`) REFERENCES `page_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `page_content`
--
ALTER TABLE `page_content`
  ADD CONSTRAINT `fk_page_content_author_to_users` FOREIGN KEY (`last_update_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_page_content_to_page` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `poems`
--
ALTER TABLE `poems`
  ADD CONSTRAINT `fk_poem_author_to_users` FOREIGN KEY (`author`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_poems_to_category` FOREIGN KEY (`category_id`) REFERENCES `poem_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `poem_category_content`
--
ALTER TABLE `poem_category_content`
  ADD CONSTRAINT `fk_poem_category_content_to_category` FOREIGN KEY (`category_id`) REFERENCES `poem_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `poem_content`
--
ALTER TABLE `poem_content`
  ADD CONSTRAINT `fk_poem_content_to_poem` FOREIGN KEY (`poem_id`) REFERENCES `poems` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_poem_content_update_to_author` FOREIGN KEY (`last_update_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `program_content`
--
ALTER TABLE `program_content`
  ADD CONSTRAINT `fk_program_content_to_program` FOREIGN KEY (`program_id`) REFERENCES `programs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `project_content`
--
ALTER TABLE `project_content`
  ADD CONSTRAINT `fk_project_content_to_id` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `site_options_content`
--
ALTER TABLE `site_options_content`
  ADD CONSTRAINT `fk_options_content_to_options` FOREIGN KEY (`option_id`) REFERENCES `site_options` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `spotlight_content`
--
ALTER TABLE `spotlight_content`
  ADD CONSTRAINT `fk_spotlight_content_to_spotlight` FOREIGN KEY (`spotlight_id`) REFERENCES `spotlight` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `story_content`
--
ALTER TABLE `story_content`
  ADD CONSTRAINT `fk_story_content_to_story` FOREIGN KEY (`story_id`) REFERENCES `stories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `team`
--
ALTER TABLE `team`
  ADD CONSTRAINT `fk_team_to_category` FOREIGN KEY (`category_id`) REFERENCES `team_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_team_to_location` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `team_category_content`
--
ALTER TABLE `team_category_content`
  ADD CONSTRAINT `fk_team_category_content_to_category` FOREIGN KEY (`category_id`) REFERENCES `team_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `team_content`
--
ALTER TABLE `team_content`
  ADD CONSTRAINT `fk_team_content_to_team` FOREIGN KEY (`team_id`) REFERENCES `team` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `test_features`
--
ALTER TABLE `test_features`
  ADD CONSTRAINT `fk_test_feature_to_category` FOREIGN KEY (`category_id`) REFERENCES `test_feature_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `test_feature_category_content`
--
ALTER TABLE `test_feature_category_content`
  ADD CONSTRAINT `fk_test_feature_category_content_to_category` FOREIGN KEY (`category_id`) REFERENCES `test_feature_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `test_feature_content`
--
ALTER TABLE `test_feature_content`
  ADD CONSTRAINT `fk_test_feature_content_to_test_feature` FOREIGN KEY (`test_feature_id`) REFERENCES `test_features` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `theme_layouts`
--
ALTER TABLE `theme_layouts`
  ADD CONSTRAINT `fk_theme_layouts_to_them` FOREIGN KEY (`theme_id`) REFERENCES `themes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `theme_templates`
--
ALTER TABLE `theme_templates`
  ADD CONSTRAINT `fk_theme_templates_to_thems` FOREIGN KEY (`theme_id`) REFERENCES `themes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
